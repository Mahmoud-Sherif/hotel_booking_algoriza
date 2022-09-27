part of 'search_cubit.dart';

abstract class SearchStates extends Equatable {
  const SearchStates();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchToMapstate extends SearchStates {}

class MapToSearchstate extends SearchStates {}
