import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.email});
  static const String routeName = 'ChatView';
  final String email;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff6f7f7),
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetImages.logo, height: 50.h, width: 50.w),
                SizedBox(width: 10.h),
                Text(
                  'Chat',
                  style: AppStyles.headline1.copyWith(fontFamily: "Roboto"),
                ),
              ],
            ),
          ),
          leading: const SizedBox(),
        ),
        body: ChatViewBody(email: email),
      ),
    );
  }
}
