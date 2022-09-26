import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:hotel_booking_algoriza/features/explore/domain/usecases/get_hotels.dart';

import '../../../../core/error/failures.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit({required this.getHotelsUseCase}) : super(ExploreInitial());
  final GetHotelsUseCase getHotelsUseCase;
  Future<void> getHotels(HotleParams hotleParams) async {
    emit(ExploreHotelsLoading());
    Either<Failure, HotelsModel> respone = await getHotelsUseCase(hotleParams);
    emit(
      respone.fold(
        (failure) => ExploreHotelsError(msg: failure.toString()),
        (hotelsModel) => ExploreHotelsLoaded(hotelsModel: hotelsModel),
      ),
    );
  }
}
