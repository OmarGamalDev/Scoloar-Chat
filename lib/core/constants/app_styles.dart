import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyles {
  static final TextStyle logocolor = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle headline1 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bodytext = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle buttonText = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
}
