

import 'package:fpdart/fpdart.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/features/auth/domain/entities/login_data.dart';

//it's just a interface
abstract interface class AuthRepository{
  Future<Either<Failures,DomainLoginResponse>> loginWithEmailPassword({
    required String email,
    required String password
});

}
