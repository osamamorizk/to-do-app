part of 'login_bloc.dart';

@immutable
class LoginEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}
