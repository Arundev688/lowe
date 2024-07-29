import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowes/core/theme/color.dart';

class AppTextStyle {

  static TextStyle title = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w600,fontSize: 20));


  static TextStyle title1 = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w600,fontSize: 24));

  static TextStyle titleWhite = GoogleFonts.geologica(
      textStyle: const TextStyle(color: white, fontWeight: FontWeight.w600,fontSize: 20));

  static TextStyle subTitle = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 18));

  static TextStyle button = GoogleFonts.geologica(
      textStyle: const TextStyle(color: white, fontWeight: FontWeight.w400,fontSize: 17));

  static TextStyle textField = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w500,fontSize: 18));

  static TextStyle textHint = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 16));

  static TextStyle textPrime = GoogleFonts.geologica(
      textStyle: const TextStyle(color: textColor, fontWeight: FontWeight.w400,fontSize: 15));

  static TextStyle content = GoogleFonts.geologica(
      textStyle: const TextStyle(color: textColor, fontWeight: FontWeight.w400,fontSize: 16));

  static TextStyle contentBold = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.bold,fontSize: 16));

  static TextStyle smallBlack = GoogleFonts.geologica(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w300,fontSize: 14));

  static TextStyle textError = GoogleFonts.geologica(
      textStyle: const TextStyle(color: error, fontWeight: FontWeight.bold,fontSize: 18));

}
