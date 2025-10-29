import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.success() = _AuthSuccess;
  const factory AuthState.error({required String message}) = _AuthError;
}