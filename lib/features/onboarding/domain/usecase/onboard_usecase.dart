import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/core/usecase/usecase.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/repository/onboard_repository.dart';

class OnboardUseCase implements UseCase<DomainOnboard, OnboardParams> {
  final OnboardRepository onboardRepository;

  const OnboardUseCase(this.onboardRepository);

  @override
  Future<Either<Failures, DomainOnboard>> call(OnboardParams params) async {
    return onboardRepository.onboard(
        type: params.type, data: params.data, createdBy: params.createdBy);
  }
}

class OnboardParams {
  final String type;
  final String data;
  final String createdBy;

  OnboardParams(
      {required this.type, required this.data, required this.createdBy});
}
