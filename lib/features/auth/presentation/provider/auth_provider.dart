import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final UserLoginUseCase loginUseCase;
  final AuthStateProvider authStateProvider;
  /*final OnboardProvider onboardProvider;*/


  AuthProvider({
    required this.loginUseCase,
    required this.authStateProvider,
  });


  bool _isLoginLoading = false;

  bool get loginLoading => _isLoginLoading;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;


  String _userName = "";
  String _email = "";
  String _role = "";

  String get userName => _userName;

  String get email => _email;

  String get role => _role;

  void updateEmail(String email) {
    _emailController.text = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _passwordController.text = password;
    notifyListeners();
  }


  Future<void> setToken({String? token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
  }

  Future<void> setUserId({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', id!);
  }

  Future<void> setUserData({required String userData}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', userData);
  }

  Future<String?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userData');
  }

  Future<Map<String, dynamic>?> getUserDataAsMap() async {
    final userDataString = await getUserData();
    if (userDataString != null) {
      return jsonDecode(userDataString) as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> getUserDetails() async {
    final userData = await getUserDataAsMap();
    if (userData != null) {
      _userName =  (userData['name'] as String?)!;
      _role = (userData['role'] as String?)!;
      _email = (userData['email'] as String?)!;
    }
  }


  Future<void> deleteData(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    //ToDo
  //  onboardProvider.updateBottomNavIndex(0);

    if (!context.mounted) return;
    context.go('/loginMobile');
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
        updatePassword("");
        updateEmail("");
      }, (success) async {
        await setToken(token: success.tokens?.access?.token.toString());
        await setUserId(id: success.user?.id);
        await setUserData(userData: jsonEncode(success.user));
        _isLoginLoading = false;
        updatePassword("");
        updateEmail("");
        if (!context.mounted) return;
        isMobile ? context.go('/dashboardMobile') : context.go('/dashboardWeb');
        notifyListeners();
      });
    } catch(e){
      _isLoginLoading = false;
      if (!context.mounted) return;
      showSnackBar(context, "Login exception is : $e");
    }
  }


  bool isValidFields(){
     if(_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty){
       return true;
     } else {
       return false;
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
