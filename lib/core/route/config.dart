import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/route/constant.dart';
import 'package:lowes/features/auth/presentation/pages/mobile/login.dart';
import 'package:lowes/features/auth/presentation/pages/web/forget_password.dart';
import 'package:lowes/features/auth/presentation/pages/web/login.dart';
import 'package:lowes/homescreen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: MyAppRouteConstants.home,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Homescreen();
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

    //mobile routes
    GoRoute(
      name: MyAppRouteConstants.loginMobile,
      path: '/loginMobile',
      builder: (BuildContext context, GoRouterState state) {
        return const MobileLogin();
      },
    ),


  ]);
}
