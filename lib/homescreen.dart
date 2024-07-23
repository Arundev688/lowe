import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/responsive.dart';
import 'package:lowes/features/auth/presentation/pages/mobile/login.dart';
import 'package:lowes/features/auth/presentation/pages/web/login.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/dashboard.dart';
import 'package:lowes/features/onboarding/presentation/pages/web/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token").toString().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isLoggedIn = snapshot.data!;
          return ResponsiveLayout(
            mobileBody: isLoggedIn ? const DashboardMobile() : const MobileLogin(),
            desktopBody: isLoggedIn ? const DashboardWeb() : const WebLogin(),
          );
        } else {
          return const Center(child: CircularProgressIndicator()); // Show loading indicator while checking
        }
      },
    );
  }
}
