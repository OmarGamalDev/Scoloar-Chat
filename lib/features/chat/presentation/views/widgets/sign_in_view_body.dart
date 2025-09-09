import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Center(child: Image.asset(AssetImages.logo)),
          SizedBox(height: 15.h),
          Text('Welcome to Scholar Chat', style: AppStyles.headline1),
          SizedBox(height: 40.h),
          Text('Sign In', style: AppStyles.headline2),
          SizedBox(height: 40.h),
          CustomTextFormField(hintText: "Email"),
          CustomTextFormField(hintText: "Password"),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CustomButton(text: "Sign in"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?', style: AppStyles.bodytext),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: AppStyles.bodytext.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
