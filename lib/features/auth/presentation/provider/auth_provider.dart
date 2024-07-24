import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:lowes/features/auth/presentation/pages/mobile/login.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final UserLoginUseCase loginUseCase;
  final AuthStateProvider authStateProvider;


  AuthProvider({
    required this.loginUseCase,
    required this.authStateProvider,
  });


  bool _isLoginLoading = false;

  bool get loginLoading => _isLoginLoading;

  Future<void> setToken({String? token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
  }

  Future<void> setUserId({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', id!);
  }

  Future<void> deleteData(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    notifyListeners();
  }


  Future<void> userLogin(
      String email, String password, BuildContext context,bool isMobile) async {
    _isLoginLoading = true;
    notifyListeners();
    try{
      final result = await loginUseCase(LoginParams(email: email, password: password));
      await result.fold((failure) {
        _isLoginLoading = false;
        showSnackBar(context, "Login Failed: ${failure.message}", true);
        notifyListeners();
      }, (success) async {
        showSnackBar(context, "Login Success");
        await setToken(token: success.tokens?.access?.token.toString());
        await setUserId(id: success.user?.id);
        _isLoginLoading = false;
        if (!context.mounted) return;
        isMobile ? context.go('/dashboardMobile') : context.go('/dashboardWeb');
        notifyListeners();
      });
    } catch(e){
      _isLoginLoading = false;
      showSnackBar(context, "Login exception is : $e");
      if(kDebugMode){
        print("Login exception is : $e");
      }
    }
  }

  String? validateLoginFields(String email, String password) {
    if (email.isEmpty) {
      return 'Please enter your email address.';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$").hasMatch(email)) {
      return 'Please enter a valid email address.';
    } else if (password.isEmpty) {
      return 'Please enter your password.';
    }
    return null; // Validation successful
  }
}
