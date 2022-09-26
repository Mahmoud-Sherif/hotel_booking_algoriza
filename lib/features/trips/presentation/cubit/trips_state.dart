part of 'trips_cubit.dart';

abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoadingState extends TripsState {}

class TripsSuccessState extends TripsState {}

class TripsErrorState extends TripsState {
  final String error;
  const TripsErrorState(this.error);
}
