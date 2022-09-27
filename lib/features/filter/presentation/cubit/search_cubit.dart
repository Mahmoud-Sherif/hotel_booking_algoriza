import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/filter/data/models/search_hotels_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.apiConsumer}) : super(SearchInitial());

  final ApiConsumer apiConsumer;

  SearchHotelsModel? searchedForHotels;

  void getHotelBySearchValue({String? value}) async {
    emit(SearchLoadingState());
    final response =
        await apiConsumer.get(EndPoints.searchHotels, queryParameters: {
      'name': value,
      'count': '10',
      'page': '1',
    });

    searchedForHotels = SearchHotelsModel.fromJson(response);
    getLatLng();
    debugPrint(searchedForHotels!.status.type);
    emit(SearchSuccessState());
  }

  navigateToMap() {
    emit(SearchToMapstate());
  }

  navigateToSearch() {
    emit(MapToSearchstate());
  }

  Set<Marker> markers = {};
  getLatLng() {
    if (searchedForHotels != null) {
      for (var hotel in searchedForHotels!.hotelModel.search) {
        return markers.add(
          Marker(
              markerId: MarkerId(hotel.name),
              position:
                  LatLng(double.parse(hotel.lat), double.parse(hotel.long))),
        );
      }
    }
  }
}
