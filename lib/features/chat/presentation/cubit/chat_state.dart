part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatLoading extends ChatState {}
class ChatSuccess extends ChatState {}
class ChatFailure extends ChatState {}
