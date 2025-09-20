part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}
class PasswordVisibilityToggled extends ChatState {}
class ChatSigninLoading extends ChatState {}
class ChatSigninSuccess extends ChatState {}
class ChatSigninFailure extends ChatState {
  final String errorMessage;
  ChatSigninFailure({required this.errorMessage});
}
class ChatRegiserLoading extends ChatState {}
class ChatRegiserSuccess extends ChatState {}
class ChatRegisterFailure extends ChatState {
  final String errorMessage;
  ChatRegisterFailure({required this.errorMessage});
}