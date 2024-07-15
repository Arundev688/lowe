

import 'dart:convert';

import 'package:lowes/core/route/api.dart';
import 'package:lowes/core/service/dio_service.dart';
import 'package:lowes/features/auth/data/models/login_model.dart';

abstract interface class AuthRemoteDataSource{
  Future<LoginResponse> loginWithEmailPassword({
   required String email,
   required String password,
});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
static var dio = DioUtil().getInstance();

  @override
  Future<LoginResponse> loginWithEmailPassword({required String email, required String password}) async {
      final baseurl = ApiRoutes().signIn;
      final response = await dio!.post(baseurl,data: {"email": password, "password": email});

      if(response.statusCode == 200){
        final responseDecode = jsonDecode(response.toString());
        return LoginResponse.fromJson(responseDecode as Map<String, dynamic>);
      } else {
        return LoginResponse();
      }

  }

}