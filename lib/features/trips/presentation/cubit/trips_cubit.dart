import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(TripsInitial());
}
