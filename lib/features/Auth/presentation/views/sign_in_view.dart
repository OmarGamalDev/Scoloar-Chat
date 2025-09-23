import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/Auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SignInViewBody(),
        ),
      ),
    );
  }
}
