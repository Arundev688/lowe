import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';

class AuthProvider extends ChangeNotifier {
  final UserLoginUseCase loginUseCase;
  final AuthStateProvider authStateProvider;

  AuthProvider({
    required this.loginUseCase,
    required this.authStateProvider,
  });

  Future<void> userLogin(
      String email, String password, BuildContext context) async {
    authStateProvider.setState(AuthState.loading);
    final result =
        await loginUseCase(LoginParams(email: email, password: password));
    await result.fold((failure) {
      authStateProvider.setState(AuthState.error);
      debugPrint(failure.message);
      showSnackBar(context, "Login Failed: ${failure.message}", true);
      notifyListeners();
    }, (success) async {
      authStateProvider.setState(AuthState.success);
      showSnackBar(context, "Login Success");
      context.go('/dashboardWeb');
      notifyListeners();
    });
  }

  String? validateLoginFields(String email, String password) {
    if (email.isEmpty) {
      return 'Please enter your email address.';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$").hasMatch(email)) {
      return 'Please enter a valid email address.';
    } else if (password.isEmpty) {
      return 'Please enter your password.';
    } /*else if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }*/
    return null; // Validation successful
  }
}
