import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/responsive.dart';
import 'package:lowes/features/auth/presentation/pages/mobile/login.dart';
import 'package:lowes/features/auth/presentation/pages/web/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileLogin(),
        desktopBody: WebLogin(),
      ),
    );
  }
}
