import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyles {
  static final TextStyle headline1 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyText1 = TextStyle(
    color: Colors.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyText3 = TextStyle(
    color: const Color(0xFF1F0FCE),
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  
  static final TextStyle bodyText4 = TextStyle(
    color: const Color(0xFF120C07),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
}
