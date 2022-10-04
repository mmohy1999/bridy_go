part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}


class ShowAndHidePassword extends AuthState{}

class LoginPageState extends AuthState {}

class LoginState extends AuthState {}

class RegisterPageState extends AuthState {}

class VerifyPageState extends AuthState {}

class RegisterState extends AuthState {}

class LogoutState extends AuthState {}
