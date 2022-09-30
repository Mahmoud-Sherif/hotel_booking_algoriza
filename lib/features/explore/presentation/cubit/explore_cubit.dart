import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hotel_booking_algoriza/config/location_services/location_services.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/usecases/get_hotels.dart';

import '../../../../core/error/failures.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit({required this.getHotelsUseCase}) : super(ExploreInitial());
  final GetHotelsUseCase getHotelsUseCase;
  late Position myPosition;
  Future<void> getHotels(HotleParams hotleParams) async {
    emit(ExploreHotelsLoading());
    myPosition = await LocationServices.getCurrentLocation();
    Either<Failure, HotelsModel> respone = await getHotelsUseCase(hotleParams);
    emit(
      respone.fold(
        (failure) => ExploreHotelsError(msg: failure.toString()),
        (hotelsModel) => ExploreHotelsLoaded(hotelsModel: hotelsModel),
      ),
    );
  }
}
