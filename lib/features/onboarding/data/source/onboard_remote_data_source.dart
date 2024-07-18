import 'dart:convert';

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
      if (response.statusCode == 200) {
        final responseDecode = jsonDecode(response.toString());
        return OnboardResponse.fromJson(responseDecode as Map<String, dynamic>);
      } else {
        return OnboardResponse();
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
