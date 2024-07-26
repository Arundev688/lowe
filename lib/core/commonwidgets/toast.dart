import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

void showSnackBar(BuildContext context,String message,[bool errorMessage = false]) {
  final snackBar = SnackBar(
    content:Text(message,style: AppTextStyle.smallBlack),
    backgroundColor: errorMessage ?  errorLight : green,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(vertical: ScreenDimensions.screenHeight(context)*0.01,
        horizontal: ScreenDimensions.screenWidth(context)*0.15),
    duration:const Duration(milliseconds: 2000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
