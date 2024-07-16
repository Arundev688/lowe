import 'dart:convert';

import 'package:lowes/core/error/exceptions.dart';
import 'package:lowes/core/route/api.dart';
import 'package:lowes/core/service/dio_service.dart';
import 'package:lowes/features/auth/data/models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static var dio = DioUtil().getInstance();

  @override
  Future<LoginResponse> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final baseurl = ApiRoutes().signIn;
      final response = await dio!
          .post(baseurl, data: {"email": password, "password": email});
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.data));
      } else {
        return LoginResponse();
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }

  }
}
