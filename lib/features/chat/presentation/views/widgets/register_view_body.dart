import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: ListView(
        children: [
          SizedBox(height: 40.h),
          Center(child: Image.asset(AssetImages.logo)),
          SizedBox(height: 15.h),
          Text('Create an account', style: AppStyles.logocolor),
          SizedBox(height: 40.h),
          Text('Register', style: AppStyles.headline1),
          SizedBox(height: 18.h),
          CustomTextFormField(hintText: "Email"),
          CustomTextFormField(hintText: "Password"),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CustomButton(text: "Sign up"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: AppStyles.bodytext),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    " Sign In",
                    style: AppStyles.bodytext.copyWith(
                      color: Color(0xffc0e4e3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
