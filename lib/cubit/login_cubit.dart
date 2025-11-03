import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:demo_flutter/API/auth_api.dart';
import 'package:demo_flutter/validators/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthApi _authApi;

  LoginCubit(this._authApi) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    if (!Validators.isvalidUser(email)) {
      emit(const LoginState.failure("❌ Invalid email format"));
      return;
    }
    if (!Validators.isvalidPass(password)) {
      emit(const LoginState.failure("❌ Password must be at least 6 chars"));
      return;
    }

    emit(const LoginState.loading());

    try {
      final response = await _authApi.login(email, password);

      if (response['access_token'] != null && response['refresh_token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response['access_token']);
        await prefs.setString('refresh_token', response['refresh_token']);

        emit(const LoginState.success());
      } else {
        emit(const LoginState.failure("Login failed: Missing token fields"));
      }
    } catch (e) {
      emit(LoginState.failure("Login error: $e"));
    }
  }

  void reset() => emit(const LoginState.initial());
}
