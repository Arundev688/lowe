import 'package:get_it/get_it.dart';
import 'package:lowes/core/route/api.dart';
import 'package:lowes/core/service/dio_service.dart';
import 'package:lowes/features/auth/data/repository/auth_repositry_impl.dart';
import 'package:lowes/features/auth/data/source/auth_remote_data_source.dart';
import 'package:lowes/features/auth/domain/repository/auth_repository.dart';
import 'package:lowes/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';

final serviceLocator = GetIt.instance;

Future<void> initDepedencies() async{
  _initAuth();
  ApiRoutes.baseUrl = 'http://34.205.146.204/';
}

void _initAuth() {

  // Datasource
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl( ),
  );
  // Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositryImpl(
      serviceLocator(),
    ),
  );
  // Usecases
  serviceLocator.registerFactory(() => UserLoginUseCase(serviceLocator()));
  //provider
  serviceLocator.registerLazySingleton(()=> AuthProvider(loginUseCase: serviceLocator()));
}
