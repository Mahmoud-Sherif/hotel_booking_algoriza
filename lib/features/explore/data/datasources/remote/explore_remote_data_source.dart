import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/usecases/get_hotels.dart';

abstract class ExploreRemoteDataSource {
  Future<HotelsModel> getHotels(HotleParams hotleParams);
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final ApiConsumer apiConsumer;
  ExploreRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<HotelsModel> getHotels(HotleParams hotleParams) async {
    final response = await apiConsumer.get(
      EndPoints.explorHotels,
      queryParameters: hotleParams.toJson(),
    );
    return HotelsModel.fromJson(response);
  }
}
