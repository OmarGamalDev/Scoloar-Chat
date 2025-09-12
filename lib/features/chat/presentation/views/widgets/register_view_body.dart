import 'dart:developer';
import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/shared_widgets/show_error_message.dart';
import 'package:chat_app/core/constants/validator.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:chat_app/core/shared_widgets/show_success_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatefulWidget {
  RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? email;

  String? password;

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

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
              Text('Create an account', style: AppStyles.logocolor),
              SizedBox(height: 40.h),
              Text(
                'Register',
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomButton(
                  text: "Sign up",
                  onTap: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                      isLoading = true;
                      setState(() {});
                      try {
                        await createuser();
                        if (!context.mounted) return;
                        showsuccessmessage(
                          context,
                          message: "User Created Successfully",
                        );
                      } on FirebaseAuthException catch (e) {
                        if (!context.mounted) return;
                        if (e.code == 'weak-password') {
                          showerrormessage(
                            context,
                            message: 'The password provided is too weak.',
                          );
                        } else if (e.code == 'email-already-in-use') {
                          showerrormessage(
                            context,
                            message:
                                'The account already exists for that email.',
                          );
                        } else {
                          showerrormessage(
                            context,
                            message: e.message.toString(),
                          );
                        }
                      } finally {
                        isLoading = false;
                        setState(() {});
                        }
                      }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: AppStyles.bodytext.copyWith(fontFamily: "Roboto"),
                    ),
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
        ),
      ),
    );
  }

  Future<void> createuser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    log(user.toString());
  }
}
