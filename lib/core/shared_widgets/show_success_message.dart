import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showsuccessmessage(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    DefaultTextStyle(
      style: const TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      child: CustomSnackBar.success(
        message: message,
      ),
    ),
  );
}

