import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.Validator,
    this.obscureText = false,
    this.suffixIcon,
  });
  final String hintText;
  final Function(String) onChanged;
  final String? Function(String?)? Validator;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        validator: Validator,
        style: TextStyle(color: Colors.grey[200], fontFamily: "Roboto"),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
