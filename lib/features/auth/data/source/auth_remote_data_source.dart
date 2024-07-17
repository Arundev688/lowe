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
          .post(baseurl, data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final responseDecode = jsonDecode(response.toString());
        return LoginResponse.fromJson(responseDecode as Map<String, dynamic>);
      } else {
        return LoginResponse();
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }

  }
}
