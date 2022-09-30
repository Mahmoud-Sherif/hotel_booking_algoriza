import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/filter/data/models/search_hotels_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.apiConsumer}) : super(SearchInitial());

  final ApiConsumer apiConsumer;

  SearchHotelsModel? searchedForHotels;
  SearchCubit of(context) => BlocProvider.of(context);
  void getHotelBySearchValue({String? value}) async {
    emit(SearchLoadingState());
    final response =
        await apiConsumer.get(EndPoints.searchHotels, queryParameters: {
      'name': value,
      'count': '10',
      'page': '1',
    });
    searchedForHotels = SearchHotelsModel.fromJson(response);
    await getLatLng();
    debugPrint(searchedForHotels!.hotelModel.search.length.toString());
    debugPrint(markers.length.toString());

    emit(SearchSuccessState());
  }

  Future<void> getHotelBySearchFilter(
      {List<int>? facilites, double? minPrice, double? maxPrice}) async {
    emit(SearchLoadingState());
    final response = await apiConsumer.get(
      EndPoints.searchHotels,
      queryParameters: {
        'min_price': minPrice!.toInt(),
        'max_price': maxPrice!.toInt(),
        'count': '10',
        'page': '1',
        'facilities[0]': facilites![0],
        'facilities[1]': facilites[1],
        'facilities[2]': facilites[2],
        'facilities[3]': facilites[3],
        'facilities[4]': facilites[4],
        'facilities[5]': facilites[5]
      },
    );

    searchedForHotels = SearchHotelsModel.fromJson(response);
    getLatLng();
    debugPrint(searchedForHotels!.hotelModel.search.length.toString());
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
    for (var hotel in searchedForHotels!.hotelModel.search) {
      markers.add(
        Marker(
            markerId: MarkerId(hotel.name),
            position: LatLng(double.parse(hotel.lat), double.parse(hotel.long)),
            infoWindow: InfoWindow(title: hotel.name)),
      );
    }
  }
}
