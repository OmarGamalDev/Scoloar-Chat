import 'package:chat_app/core/constants/app_styles.dart';
import 'package:chat_app/core/constants/asset_images.dart';
import 'package:chat_app/core/constants/validator.dart';
import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:chat_app/core/shared_widgets/show_error_message.dart';
import 'package:chat_app/core/shared_widgets/show_success_message.dart';
import 'package:chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatRegiserLoading) {
          isLoading = true;
        } else if (state is ChatRegiserSuccess) {
          isLoading = false;
          showsuccessmessage(context, message: "User Created Success");
          Navigator.pushReplacementNamed(context, ChatView.routeName,arguments: email);
        } else if (state is ChatRegisterFailure) {
          isLoading = false;
          showerrormessage(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
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
                    obscureText: context.read<ChatCubit>().isPasswordHidden,
                    suffixIcon: IconButton(
                      icon: Icon(
                        context.read<ChatCubit>().isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<ChatCubit>().togglePasswordVisibility();
                      },
                    ),
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomButton(
                      text: "Sign up",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ChatCubit>(
                            context,
                          ).createuser(email: email!, password: password!);
                        } else {}
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppStyles.bodytext.copyWith(
                            fontFamily: "Roboto",
                          ),
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
      },
    );
  }
}
