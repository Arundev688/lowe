import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class ShowCustomToast {
  SnackBar showToast({bool errorMessage = false, String? message}) {
    return SnackBar(
      content: Text(
        message!,
        style: AppTextStyle.button,
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      backgroundColor: errorMessage ? error : green,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: textColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
