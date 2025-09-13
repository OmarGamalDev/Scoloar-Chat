import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String id;
  MessageModel(this.message, this.id);
  factory MessageModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(data['message'] ?? "", data['id'] ?? "");
  }
}
