import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUtil {
  Dio? _instance;

  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();
    return dio
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        var accessToken = prefs.getString('token');
        options.headers["Authorization"] = "Bearer $accessToken";
        return handler.next(options); //modify your request
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioException e, handler) async {
        if (e.response != null) {
          if (e.response!.statusCode == 401) {
            if(kDebugMode){
              print("${e.response!.statusCode} ${e.response?.data}");
            }
          } else if (e.response!.statusCode == 403) {
            print("${e.response!.statusCode} ${e.response?.data}");
          } else if (e.response!.statusCode == 500) {
            print("${e.response!.statusCode} ${e.response?.data}");
            handler.resolve(e.response!);
          } else {
            handler.resolve(e.response!);
          }
        }
      }));
  }
}
