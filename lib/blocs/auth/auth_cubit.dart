import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_quality/services/auth_service.dart';
import 'package:air_quality/services/storage_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService _apiService;
  final StorageService _storageService;

  AuthCubit(this._apiService, this._storageService)
      : super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    try {
      final result = await _apiService.login(email, password);
      final accessToken = result['access_token'];
      final refreshToken = result['refresh_token'];

      await _storageService.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      emit(const AuthState.success());
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      emit(AuthState.error(message: errorMessage));
    }
  }
}