import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
 
  List<MessageModel> messagesList = [];
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  Future<void> sendMessage({
    required String message,
    required String email,
  }) async {
    try {
      await messages.add({
        "message": message,
        "time": DateTime.now(),
        "id": email,
      });
      emit(SendMessageSuccess());
    } on Exception catch (e) {
      emit(SendMessageFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getMessages() async {
    messages.orderBy('time', descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
