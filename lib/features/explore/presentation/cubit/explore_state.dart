part of 'explore_cubit.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreHotelsLoading extends ExploreState {}

class ExploreHotelsLoaded extends ExploreState {
  final HotelsModel hotelsModel;
  const ExploreHotelsLoaded({required this.hotelsModel});
  @override
  List<Object> get props => [hotelsModel];
}

class ExploreHotelsError extends ExploreState {
  final String msg;
  const ExploreHotelsError({required this.msg});
  @override
  List<Object> get props => [msg];
}
