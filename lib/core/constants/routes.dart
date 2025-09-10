
import 'package:chat_app/features/chat/presentation/material_page_route_not_found.dart';
import 'package:chat_app/features/chat/presentation/views/register_view.dart';
import 'package:chat_app/features/chat/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    default:
      return MaterialPageRoute(
        builder: (_) => const MaterialPageRouteNotFound(),
      );
  }
}
