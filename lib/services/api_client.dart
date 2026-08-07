import 'package:dio/dio.dart';
import 'auth_service.dart';
import 'token_storage.dart';

class ApiClient {
  late final Dio dio;

  final TokenStorage tokenStorage;
  final AuthService authService;
  final Future<void> Function()? onSessionExpired;

  Future<bool>? _refreshingToken;

  ApiClient({
    required this.tokenStorage,
    required this.authService,
    this.onSessionExpired,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: AuthService.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await tokenStorage.getAccessToken();

          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
            // các request API sẽ được gửi kèm accessToken trong header Authorization
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          final isUnauthorized = error.response?.statusCode == 401;
          final isRetry = error.requestOptions.extra['retried'] == true;
          // kiểm tra xem lỗi có phải là 401 (Unauthorized) và request đã được retry hay chưa
          if (!isUnauthorized || isRetry) {
            handler.next(error);
            return;
          }

          try {
            _refreshingToken ??= authService.refreshToken();

            final refreshed = await _refreshingToken!;
            _refreshingToken = null;

            if (!refreshed) {
              await onSessionExpired?.call();
              handler.next(error);
              return;
            }

            final accessToken = await tokenStorage.getAccessToken();
            final request = error.requestOptions;

            request.extra['retried'] = true;
            request.headers['Authorization'] = 'Bearer $accessToken';
            // thêm accessToken mới vào header Authorization của request

            final response = await dio.fetch(request);
            // retry request với accessToken mới được cấp
            handler.resolve(response);
          } catch (_) {
            _refreshingToken = null;
            await tokenStorage.clearTokens();
            await onSessionExpired?.call();
            handler.next(error);
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getProfile() async {
    final response = await dio.get('/auth/profile');
    return Map<String, dynamic>.from(response.data);
  }
  // gửi request GET đến endpoint /auth/profile để lấy thông tin người dùng,
}
