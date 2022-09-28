import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';
import 'package:hotel_booking_algoriza/features/profile/data/datasources/local/profile_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/profile/data/models/profile_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/netwok_info.dart';
import '../../domain/repositories/profile_repo.dart';
import '../../domain/usecases/get_profile_data_usecase copy.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../datasources/remote/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  /// Data Source
  final NetworkInfo networkInfo;
  final ProfileRemoteDatasource profileRemoteDatasource;
  final ProfileLocalDataSource profileLocalDataSource;
  const ProfileRepositoryImpl({
    required this.profileRemoteDatasource,
    required this.profileLocalDataSource,
    required this.networkInfo,
  });

  @override
  // Future<Either<Failure, ProfileModel>> Profile(GetProfileParams getProfileParams) async {
  //   // check if internet connected
  //   try {
  //     final response = await authRemoteDatasource.getProfile(getProfileParams);
  //     // cach
  //     authLocalDataSource.cachToken(response.user!.token);
  //     return Right(response);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
  @override
  Future<Either<Failure, ProfileModel>> updateProfile(
    ProfileParams updateProfileParams,
  ) async {
    try {
      final response = await profileRemoteDatasource.updateProfile(updateProfileParams);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async{
    try {
      final response = await profileRemoteDatasource.getProfile();

      // cach
      //profileLocalDataSource.cachToken(response);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
