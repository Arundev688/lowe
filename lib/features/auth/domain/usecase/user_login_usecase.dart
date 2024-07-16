import 'package:fpdart/src/either.dart';
import 'package:lowes/core/error/failures.dart';
import 'package:lowes/core/usecase/usecase.dart';
import 'package:lowes/features/auth/domain/entities/login_data.dart';
import 'package:lowes/features/auth/domain/repository/auth_repository.dart';

class UserLoginUseCase implements UseCase<DomainLoginResponse, LoginParams> {
  final AuthRepository authRepository;

  const UserLoginUseCase(this.authRepository);

  @override
  Future<Either<Failures, DomainLoginResponse>> call(LoginParams params) async {
    return authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
