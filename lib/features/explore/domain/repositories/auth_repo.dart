import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import '../../../../core/error/failures.dart';
import '../usecases/get_hotels.dart';

abstract class ExploreRepo {
  Future<Either<Failure, HotelsModel>> getHotels(HotleParams hotleParams);
}
