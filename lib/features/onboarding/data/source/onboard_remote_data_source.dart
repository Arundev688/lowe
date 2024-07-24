import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/exceptions.dart';
import 'package:lowes/core/route/api.dart';
import 'package:lowes/core/service/dio_service.dart';
import 'package:lowes/features/onboarding/data/model/onboard_response.dart';

abstract class OnboardRemoteDateSource {
  Future<OnboardResponse> onboard({
    required String type,
    required String data,
    required String createdBy,
  });
  Future<Unit?> association ({
    required String packageData,
    required String packageType,
    required String sensorData,
    required String sensorType,
    required String createdBy,
});


}

class OnboardRemoteDateSourceImpl implements OnboardRemoteDateSource {
  static var dio = DioUtil().getInstance();

  @override
  Future<OnboardResponse> onboard(
      {required String type,
      required String data,
      required String createdBy}) async {
    final baseurl = ApiRoutes().onBoard;
    try {
      final response = await dio!.post(baseurl, data: {
        "scannedInfo": {
          "type": type,
          "data": data,
        },
        "createdBy": createdBy,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseDecode = jsonDecode(response.toString());
        return OnboardResponse.fromJson(responseDecode as Map<String, dynamic>);
      } else if(response.statusCode == 400) {
        throw const ServerExceptions("Incorrect Scan Found!");
      } else if (response.statusCode == 401){
        throw const ServerExceptions("Please authenticate");
      } else {
        throw const ServerExceptions("An Unexpected Error Occurred");
      }
    } catch (e) {
      throw const ServerExceptions("Incorrect Scan Found!");
    }
  }

  @override
  Future<Unit?> association({required String packageData, required String packageType, required String sensorData, required String sensorType, required String createdBy}) async{
    final baseurl = ApiRoutes().association;
    try {
      final response = await dio!.post(baseurl, data: {
        "packageScannedInfo":{
          "data":packageData,
          "type":packageType
        },
        "sensorScannedInfo":{
          "data":sensorData,
          "type":sensorType
        },
        "createdBy": createdBy,
      });
      /*if(kDebugMode){
        print("Association data :: +${{
        "packageScannedInfo":{
        "data":packageData,
        "type":packageType
        },
        "sensorScannedInfo":{
        "data":sensorData,
        "type":sensorType
        },
        "createdBy": createdBy,
        }}");
        print("Associate  result is  :: ${unit.toString()}");
        print("Associate  status code  is  :: ${response.statusCode}");
        print("Associate  header  is  :: ${response.headers}");
        print("Associate  base url  is  :: $baseurl");
      }*/
      if (response.statusCode == 200 || response.statusCode == 201) {
        return unit;
      } else if (response.statusCode == 401){
        throw const ServerExceptions("Please authenticate");
      }else if (response.statusCode == 400){
        final errorMessage = response.data['message'] ?? 'Bad Request';
        throw ServerExceptions(errorMessage);
      } else {
        throw const ServerExceptions("An Unexpected Error Occurred");
      }
    } catch (e) {
      throw const ServerExceptions("An Unexpected Error Occurred");
    }
  }



}
