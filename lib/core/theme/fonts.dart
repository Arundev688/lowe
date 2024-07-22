import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowes/core/theme/color.dart';

class AppTextStyle {

  static TextStyle title = GoogleFonts.inter(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w600,fontSize: 19));

  static TextStyle titleWhite = GoogleFonts.inter(
      textStyle: const TextStyle(color: white, fontWeight: FontWeight.w600,fontSize: 19));

  static TextStyle subTitle = GoogleFonts.inter(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 17));

  static TextStyle button = GoogleFonts.inter(
      textStyle: const TextStyle(color: white, fontWeight: FontWeight.w400,fontSize: 15));

  static TextStyle textField = GoogleFonts.inter(
      textStyle: const TextStyle(color: black, fontWeight: FontWeight.w500,fontSize: 14));

  static TextStyle textHint = GoogleFonts.inter(
      textStyle: const TextStyle(color: lightText, fontWeight: FontWeight.w200,fontSize: 13));

  static TextStyle textPrime = GoogleFonts.inter(
      textStyle: const TextStyle(color: textColor, fontWeight: FontWeight.w400,fontSize: 14));

}
