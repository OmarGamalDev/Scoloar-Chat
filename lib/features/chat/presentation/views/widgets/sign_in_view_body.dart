import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/constants/validator.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:chat_app/core/shared_widgets/show_error_message.dart';
import 'package:chat_app/core/shared_widgets/show_success_message.dart';
import 'package:chat_app/features/chat/presentation/views/chat_view.dart';
import 'package:chat_app/features/chat/presentation/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatefulWidget {
 const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  String? email;

  String? password;

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
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
                onChanged: (data) {
                  email = data;
                },
              ),
              CustomTextFormField(
                Validator: Validator.validatePassword,
                hintText: "Password",
                onChanged: (data) {
                  password = data;
                },
                obscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomButton(
                  onTap: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    isLoading = true;
                    setState(() {});
                    try {
                      await signin();
                      if (!context.mounted) return;
                      showsuccessmessage(
                        context,
                        message: "Sign in successful",
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        ChatView.routeName,
                        arguments: email,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (!context.mounted) return;
                      if (e.code == 'user-not-found') {
                        showerrormessage(
                          context,
                          message: 'No user found for that email.',
                        );
                      } else if (e.code == 'wrong-password') {
                        showerrormessage(
                          context,
                          message: 'Wrong password provided for that user.',
                        );
                      } else {
                        showerrormessage(
                          context,
                          message: e.message ?? 'Something went wrong',
                        );
                      }
                    } finally {
                      isLoading = false;
                      setState(() {});
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
      ),
    );
  }

  Future<void> signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
