


import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/exceptions.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/features/auth/data/source/auth_remote_data_source.dart';
import 'package:lowes/features/auth/domain/entities/login_data.dart';
import 'package:lowes/features/auth/domain/repository/auth_repository.dart';

//AuthRepositryImpl class is the implementation of AuthRepository interface
class AuthRepositryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, DomainLoginResponse>> loginWithEmailPassword({required String email, required String password}) async {
    try {
    final result = await remoteDataSource.loginWithEmailPassword(email: email, password: password);

    return Right(result);
    } on ServerExceptions catch(e){
        return Either.left(Failures(e.message));
    }
  }

}