import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  bool isPasswordHidden = true;
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(PasswordVisibilityToggled());
  }

  Future<void> signin({required String email, required String password}) async {
    emit(ChatSigninLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(ChatSigninSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ChatSigninFailure(errorMessage: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(
          ChatSigninFailure(
            errorMessage: "Wrong password provided for that user",
          ),
        );
      }
    } catch (e) {
      emit(ChatSigninFailure(errorMessage: "something went wrong"));
    }
  }

  Future<void> createuser({
    required String email,
    required String password,
  }) async {
    emit(ChatRegiserLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(ChatRegiserSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          ChatRegisterFailure(
            errorMessage: "The password provided is too weak",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          ChatRegisterFailure(
            errorMessage: "The account already exists for that email",
          ),
        );
      } else {}
    } on Exception catch (e) {
      emit(ChatRegisterFailure(errorMessage: e.toString()));
    }
  }

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
