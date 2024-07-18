import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/route/config.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/init_dependencies.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark, // navigation bar color
    statusBarColor: secondary, // status bar color
  ));
  await initDepedencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => serviceLocator<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => serviceLocator<AuthStateProvider>()),
      ],
      child: const MyApp(),
    ),
  );
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
