
import 'package:chat_app/features/chat/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
