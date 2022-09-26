import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/repositories/auth_repo.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/register_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hotel_booking_algoriza/features/explore/data/datasources/remote/explore_remote_data_source.dart';
import 'package:hotel_booking_algoriza/features/explore/data/repositories/explore_repo_impl.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/repositories/auth_repo.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/usecases/get_hotels.dart';
import 'package:hotel_booking_algoriza/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/netwok_info.dart';
import 'features/auth/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //! Blocs

  // Auth Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
    ),
  );
  // Explore Cubit
  sl.registerFactory<ExploreCubit>(
    () => ExploreCubit(
      getHotelsUseCase: sl(),
    ),
  );
  // sl.registerFactory<LocaleCubit>(
  //     () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  //! Use cases
  // Auth UseCases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepo: sl()));
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepo: sl()));
  // Explore UseCases
  sl.registerLazySingleton<GetHotelsUseCase>(
      () => GetHotelsUseCase(exploreRepo: sl()));
  // sl.registerLazySingleton<GetSavedLangUseCase>(
  //     () => GetSavedLangUseCase(langRepository: sl()));
  // sl.registerLazySingleton<ChangeLangUseCase>(
  //     () => ChangeLangUseCase(langRepository: sl()));

  //! Repository
  // Auth Repo
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        authRemoteDatasource: sl(), authLocalDataSource: sl()),
  );
  // Explore Repo
  sl.registerLazySingleton<ExploreRepo>(
      () => ExploreRepositoryImpl(exploreRemoteDataSource: sl()));
  //! Data Sources
  // Auth DataSource
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  // Explore DataSource
  sl.registerLazySingleton<ExploreRemoteDataSource>(
      () => ExploreRemoteDataSourceImpl(apiConsumer: sl()));

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
