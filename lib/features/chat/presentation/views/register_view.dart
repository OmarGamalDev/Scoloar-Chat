import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: RegisterViewBody(),
    );
  }
}
