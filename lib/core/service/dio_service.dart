import 'package:dio/dio.dart';
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
    options.headers["Authorization"] = "Bearer " + accessToken.toString();
    return handler.next(options); //modify your request
   }, onResponse: (response, handler) {
    if (response != null) {
     return handler.next(response);
    }
   }, onError: (DioError e, handler) async {
    if (e.response != null) {
     if (e.response!.statusCode == 401) {

     } else if (e.response!.statusCode == 403) {

     } else if (e.response!.statusCode == 500) {

      handler.resolve(e.response!);
     } else {

      handler.resolve(e.response!);
     }
    }
   }));
 }
}
