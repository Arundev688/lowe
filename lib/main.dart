import 'package:flutter/material.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/route/config.dart';
import 'package:lowes/core/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Constants.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: primary,
            primary: primary,
            secondary: secondary,
            shadow: lightText,
            error: error),
        useMaterial3: true,
      ),
      routerConfig: MyAppRouter().router,
    );
  }
}
