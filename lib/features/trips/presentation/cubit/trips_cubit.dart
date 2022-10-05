import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/booking/data/models/booking_hotels_model.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit({required this.apiConsumer}) : super(TripsInitial());

  static TripsCubit get(context) => BlocProvider.of(context);

  final ApiConsumer apiConsumer;

  BookingHotelsModel? upcommingHotels;

  BookingHotelsModel? completedHotels;

  BookingHotelsModel? cancelledHotels;

  void getAllHotelsByTypeUpcomming() async {
    emit(TripsLoadingState());
    final response =
        await apiConsumer.get(EndPoints.getBooking, queryParameters: {
      'type': 'upcomming',
      'count': '10',
    });

    upcommingHotels = BookingHotelsModel.fromJson(response);
    debugPrint(upcommingHotels!.status.type);
    emit(TripsSuccessState());
  }

  void getAllHotelsByTypeCompleted() async {
    emit(TripsLoadingState());
    final response = await apiConsumer.get(
      EndPoints.getBooking,
      queryParameters: {
        'type': 'completed',
        'count': '10',
      },
    );

    completedHotels = BookingHotelsModel.fromJson(response);
    debugPrint(completedHotels!.status.type);
    emit(TripsSuccessState());
  }

  void getAllHotelsByTypeCancelled() async {
    emit(TripsLoadingState());
    final response =
        await apiConsumer.get(EndPoints.getBooking, queryParameters: {
      'type': 'cancelled',
      'count': '10',
    });

    cancelledHotels = BookingHotelsModel.fromJson(response);
    debugPrint(cancelledHotels!.status.type);
    emit(TripsSuccessState());
  }
}
