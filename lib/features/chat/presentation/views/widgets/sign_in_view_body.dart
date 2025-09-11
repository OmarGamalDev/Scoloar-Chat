import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/constants/validator.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:chat_app/features/chat/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(height: 40.h),
            Center(child: Image.asset(AssetImages.logo)),
            SizedBox(height: 15.h),
            Text('Welcome to Scholar Chat', style: AppStyles.logocolor),
            SizedBox(height: 40.h),
            Text(
              'Sign In',
              style: AppStyles.headline1.copyWith(fontFamily: "Roboto"),
            ),
            SizedBox(height: 18.h),
            CustomTextFormField(
              Validator: Validator.validateEmail,
              hintText: "Email",
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              Validator: Validator.validatePassword,
              hintText: "Password",
              onChanged: (String value) {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomButton(
                onTap: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                },
                text: "Sign in",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppStyles.bodytext.copyWith(fontFamily: "Roboto"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                    child: Text(
                      "Register",
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
      ),
    );
  }
}
