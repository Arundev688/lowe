//it's just a interface
import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';


abstract interface class OnboardRepository{
  Future<Either<Failures,DomainOnboard>> onboard({
    required String type,
    required String data,
    required String createdBy,
  });

  Future<Either<Failures,Unit?>> association ({
    required String packageData,
    required String packageType,
    required String sensorData,
    required String sensorType,
    required String createdBy,
  });


}
