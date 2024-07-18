import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/route/constant.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/dashboard.dart';
import 'package:lowes/features/auth/presentation/pages/mobile/login.dart';
import 'package:lowes/features/onboarding/presentation/pages/web/home.dart';
import 'package:lowes/features/auth/presentation/pages/web/forget_password.dart';
import 'package:lowes/features/auth/presentation/pages/web/login.dart';
import 'package:lowes/features/auth/presentation/pages/web/reset_password.dart';
import 'package:lowes/homescreen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: MyAppRouteConstants.home,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),

    //web routes
    GoRoute(
      name: MyAppRouteConstants.loginWeb,
      path: '/loginWeb',
      builder: (BuildContext context, GoRouterState state) {
        return const WebLogin();
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.forgetWeb,
      path: '/forgetWeb',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgetPasswordWeb();
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.resetWeb,
      path: '/resetWeb',
      builder: (BuildContext context, GoRouterState state) {
        return const ResetPasswordWeb();
      },
    ),

    GoRoute(
      name: MyAppRouteConstants.dashboardWeb,
      path: '/dashboardWeb',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeWeb();
      },
    ),


    //mobile routes
    GoRoute(
      name: MyAppRouteConstants.loginMobile,
      path: '/loginMobile',
      builder: (BuildContext context, GoRouterState state) {
        return const MobileLogin();
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.dashboardMobile,
      path: '/dashboardMobile',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardMobile();
      },
    ),

  ]);
}
