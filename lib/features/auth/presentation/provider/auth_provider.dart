import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final UserLoginUseCase loginUseCase;

  AuthProvider({
    required this.loginUseCase,
  });


  Future<void> userLogin(String email,String password,BuildContext context) async{
      final result = await loginUseCase(LoginParams(email: email, password: password));
      await result.fold((l) => null, (r) async {
        if(r.user != null){
          ShowCustomToast().showToast(message: "Login Success");
          context.go('/dashboardWeb');
        } else {
          ShowCustomToast().showToast(message: "Login Fails");
        }

      });
    //  ShowCustomToast().showToast(message: "Something wrong");
  }


}
