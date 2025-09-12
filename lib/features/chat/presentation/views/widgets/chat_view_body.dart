import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatViewBody extends StatelessWidget {
  ChatViewBody({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChatBubble(
                color: AppColors.primaryColor,
                text:
                    'Chat Messages will be displayed here. This is message number ${index + 1}.',
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: messageController,
            onSubmitted: (data) {
              messages.add({"message": data});
              messageController.clear();
            },
            decoration: InputDecoration(
              hintText: 'Type your message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Colors.black),
              ),
              suffixIcon: Icon(Icons.send, color: AppColors.primaryColor),
              // Handle send button press
            ),
          ),
        ),
      ],
    );
  }
}
