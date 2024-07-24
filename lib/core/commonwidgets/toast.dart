import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

void showSnackBar(BuildContext context,String message,[bool errorMessage = false]) {
  final snackBar = SnackBar(
    content: Text(message,style: AppTextStyle.button),
    backgroundColor: errorMessage ?  error : green,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(50),
    elevation: 30,
    duration:const Duration(milliseconds: 4000) ,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
