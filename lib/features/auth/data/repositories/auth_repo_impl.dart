import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDataSource authLocalDataSource;
  const AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> login(LoginParams loginParams) async {
    // check if internet connected
    try {
      final response = await authRemoteDatasource.login(loginParams);
      // cach
      authLocalDataSource.cachToken(response.user!.token);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
