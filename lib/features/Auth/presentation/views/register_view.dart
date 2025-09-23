import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/Auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: RegisterViewBody(),
      ),
    );
  }
}
