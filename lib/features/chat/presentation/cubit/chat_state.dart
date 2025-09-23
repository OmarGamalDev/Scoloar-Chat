part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}
class SendMessageSuccess extends ChatState {}
class SendMessageFailure extends ChatState {
  final String errorMessage;
  SendMessageFailure({required this.errorMessage});
}
class ChatSuccess extends ChatState {
  List<MessageModel> messages = [];
  ChatSuccess({required this.messages});
}