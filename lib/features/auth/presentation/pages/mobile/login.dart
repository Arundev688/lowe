import 'package:flutter/material.dart';
import 'package:lowes/core/theme/fonts.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(style: AppTextStyle.title, "mobile login"));
  }
}
