import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/features/Auth/presentation/views/sign_in_view.dart';
import 'package:chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ScoloarChat());
}

class ScoloarChat extends StatelessWidget {
  const ScoloarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          initialRoute: SignInView.routeName,
          theme: ThemeData(
            textTheme: GoogleFonts.pacificoTextTheme(
              Theme.of(context).textTheme,
            ),
            primaryTextTheme: GoogleFonts.pacificoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
        ),
      ),
    );
  }
}
