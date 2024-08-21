part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final String successMessage;

  AuthLoginSuccess({required this.successMessage});
}

final class AuthRegisterSuccess extends AuthState {
  final String successMessage;

  AuthRegisterSuccess({required this.successMessage});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}

final class AuthLogOutSuccess extends AuthState {
  final String successMessage;

  AuthLogOutSuccess({required this.successMessage});
}
