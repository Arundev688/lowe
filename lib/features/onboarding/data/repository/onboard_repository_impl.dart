



//AuthRepositryImpl class is the implementation of AuthRepository interface
import 'package:fpdart/src/either.dart';
import 'package:lowes/core/error/exceptions.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/features/onboarding/data/source/onboard_remote_data_source.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/repository/onboard_repository.dart';

class OnboardRepositryImpl implements OnboardRepository{
  final OnboardRemoteDateSource remoteDataSource;
  const OnboardRepositryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, DomainOnboard>> onboard({required String type, required String data, required String createdBy}) async {
    try{
      final result = await remoteDataSource.onboard(type: type, data: data, createdBy: createdBy);
      return Right(result);
    } on ServerExceptions catch(e){
      return Either.left(Failures(e.message));
    }
  }

}