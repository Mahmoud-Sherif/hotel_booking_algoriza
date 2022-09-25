import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/repositories/auth_repo.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/register_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/netwok_info.dart';
import 'features/auth/domain/usecases/login_usecase copy.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //! Blocs
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
    ),
  );
  // sl.registerFactory<LocaleCubit>(
  //     () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepo: sl()));
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepo: sl()));
  // sl.registerLazySingleton<GetSavedLangUseCase>(
  //     () => GetSavedLangUseCase(langRepository: sl()));
  // sl.registerLazySingleton<ChangeLangUseCase>(
  //     () => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        authRemoteDatasource: sl(), authLocalDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
