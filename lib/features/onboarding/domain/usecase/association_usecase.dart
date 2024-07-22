import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/core/usecase/usecase.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/repository/onboard_repository.dart';

class AssociationUseCase implements UseCase<Unit, AssociationParams> {
  final OnboardRepository onboardRepository;

  const AssociationUseCase(this.onboardRepository);

  @override
  Future<Either<Failures, Unit>> call(AssociationParams params) async {
    return onboardRepository.association(packageData: params.packageData,
        packageType: params.packageType,
        sensorData: params.sensorData,
        sensorType: params.sensorType,
        createdBy: params.createdBy);
  }
}

class AssociationParams {
  final String packageData;
  final String packageType;
  final String sensorData;
  final String sensorType;
  final String createdBy;

  AssociationParams(this.packageData, this.packageType, this.sensorData,
      this.sensorType, this.createdBy);
}
