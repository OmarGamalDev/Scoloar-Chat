import 'package:chat_app/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          top: 16.h,
          bottom: 16.h,
          right: 20.w,
        ),
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.bodytext.copyWith(
            fontFamily: "Roboto",
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
