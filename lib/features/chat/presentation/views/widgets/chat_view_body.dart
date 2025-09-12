import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ChatBubble(
          color: AppColors.primaryColor,
          text:
              'Chat Messages will be displayed here. This is message number ${index + 1}.',
        );
      },
    );
  }
}
