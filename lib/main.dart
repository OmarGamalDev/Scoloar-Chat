import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/features/chat/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ScoloarChat());
}

class ScoloarChat extends StatelessWidget {
  const ScoloarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: true,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SignInView.routeName,
        theme: ThemeData(textTheme: GoogleFonts.pacificoTextTheme()),
      ),
    );
  }
}
