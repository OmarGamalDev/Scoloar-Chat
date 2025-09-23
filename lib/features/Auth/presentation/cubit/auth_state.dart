part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class PasswordVisibilityToggled extends AuthState {}
class ChatSigninLoading extends AuthState {}
class ChatSigninSuccess extends AuthState {}
class ChatSigninFailure extends AuthState {
  final String errorMessage;
  ChatSigninFailure({required this.errorMessage});
}
class ChatRegiserLoading extends AuthState {}
class ChatRegiserSuccess extends AuthState {}
class ChatRegisterFailure extends AuthState {
  final String errorMessage;
  ChatRegisterFailure({required this.errorMessage});
}
