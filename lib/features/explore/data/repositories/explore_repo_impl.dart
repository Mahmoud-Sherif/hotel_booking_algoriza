import 'package:hotel_booking_algoriza/features/explore/data/datasources/remote/explore_remote_data_source.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:hotel_booking_algoriza/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/repositories/auth_repo.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/usecases/get_hotels.dart';

import '../../../../core/error/exceptions.dart';

class ExploreRepositoryImpl implements ExploreRepo {
  final ExploreRemoteDataSource exploreRemoteDataSource;

  ExploreRepositoryImpl({required this.exploreRemoteDataSource});
  @override
  Future<Either<Failure, HotelsModel>> getHotels(
      HotleParams hotleParams) async {
    // check if internet connected
    try {
      final respone = await exploreRemoteDataSource.getHotels(hotleParams);
      //cash
      return Right(respone);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
