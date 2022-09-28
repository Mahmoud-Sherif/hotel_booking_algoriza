part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class UserProfileLodaing extends ProfileState {}

class ProfileDataLoaded extends ProfileState {
  const ProfileDataLoaded({required this.profileModel});
  final ProfileModel profileModel;
  @override
  List<Object> get props => [profileModel];
}

class GetProfileDateError extends ProfileState {
  final String msg;
  const GetProfileDateError({required this.msg});
  @override
  List<Object> get props => [msg];
}

// register ststes
class ProfileDataLodaing extends ProfileState {}

class UpdatedDataLoaded extends ProfileState {
  const UpdatedDataLoaded({required this.profileModel});
  final ProfileModel profileModel;
  @override
  List<Object> get props => [profileModel];
}

class UpdateProfileError extends ProfileState {
  final String msg;
  const UpdateProfileError({required this.msg});
  @override
  List<Object> get props => [msg];
}