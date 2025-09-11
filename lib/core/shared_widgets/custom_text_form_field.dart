import 'package:chat_app/core/constants/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.Validator,
  });
  final String hintText;
  final Function(String) onChanged;
  final String? Function(String?)? Validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: TextFormField(
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
        ),
      ),
    );
  }
}
