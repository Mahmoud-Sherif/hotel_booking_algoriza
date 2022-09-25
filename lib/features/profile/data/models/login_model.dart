import 'package:hotel_booking_algoriza/core/models/status_model.dart';
import 'package:hotel_booking_algoriza/core/models/user_model.dart';

class ProfileModel {
  final StatusModel status;
  final UserModel user;

  ProfileModel({
    required this.status,
    required this.user,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      user: UserModel.fromJson(json['data']),
    );
  }
}
