import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatViewBody extends StatelessWidget {
  ChatViewBody({super.key, required this.email});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  ScrollController scrollController = ScrollController();

  final TextEditingController messageController = TextEditingController();
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('time', descending: true).snapshots(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < asyncSnapshot.data!.docs.length; i++) {
            messagesList.add(
              MessageModel.fromJson(
                asyncSnapshot.data!.docs[i].data() as Map<String, dynamic>,
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(text: messagesList[index].message)
                        : ChatBubbleToFriend(text: messagesList[index].message);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: messageController,
                  onSubmitted: (data) {
                    if (data.isEmpty) {
                      return;
                    }
                    messages.add({
                      "message": data,
                      "time": DateTime.now(),
                      "id": email,
                    });
                    messageController.clear();
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send, color: AppColors.primaryColor),
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          messages.add({
                            "message": messageController.text,
                            "time": DateTime.now(),
                            "id": email,
                          });
                          messageController.clear();
                          scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('An error occurred'));
        }
      },
    );
  }
}
