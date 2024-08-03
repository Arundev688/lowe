import 'package:get_it/get_it.dart';
import 'package:lowes/core/route/api.dart';
import 'package:lowes/features/auth/data/repository/auth_repositry_impl.dart';
import 'package:lowes/features/auth/data/source/auth_remote_data_source.dart';
import 'package:lowes/features/auth/domain/repository/auth_repository.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/data/repository/onboard_repository_impl.dart';
import 'package:lowes/features/onboarding/data/source/onboard_remote_data_source.dart';
import 'package:lowes/features/onboarding/domain/repository/onboard_repository.dart';
import 'package:lowes/features/onboarding/domain/usecase/association_usecase.dart';
import 'package:lowes/features/onboarding/domain/usecase/onboard_usecase.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/secrets/base_url.dart';

final serviceLocator = GetIt.instance;

Future<void> initDepedencies() async {
  _initAuth();
  _initAuthState();
  _initOnboardProvider();



  final val = ApiRoutes.baseUrl = baseUrl;
  serviceLocator.registerLazySingleton(() => val);
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(),
    )
  // Repository
    ..registerFactory<AuthRepository>(
          () =>
          AuthRepositryImpl(
            serviceLocator(),
          ),
    )
  // Usecases
    ..registerFactory(() => UserLoginUseCase(serviceLocator()))
  //provider
    ..registerLazySingleton(() =>
      AuthProvider(
          loginUseCase: serviceLocator(),
          authStateProvider: serviceLocator()));
  }

void _initAuthState() {
  serviceLocator.registerLazySingleton(() => AuthStateProvider());
}

void _initOnboardProvider() {
// Datasource
  serviceLocator
    ..registerFactory<OnboardRemoteDateSource>(
          () => OnboardRemoteDateSourceImpl(),
    )
// Repository
    ..registerFactory<OnboardRepository>(
          () =>
          OnboardRepositryImpl(
            serviceLocator(),
          ),
    )
// Usecases
    ..registerFactory(() =>
        OnboardUseCase(serviceLocator()))..registerFactory(() =>
      AssociationUseCase(serviceLocator()))

//provider
    ..registerLazySingleton(() =>
        OnboardProvider(
            onboardUseCase: serviceLocator(),
            authStateProvider: serviceLocator(),
            associationUseCase: serviceLocator()));
}