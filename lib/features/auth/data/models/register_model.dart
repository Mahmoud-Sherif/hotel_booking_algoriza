import 'package:hotel_booking_algoriza/core/models/status_model.dart';
import 'package:hotel_booking_algoriza/core/models/user_model.dart';

class RegisterModel {
  final StatusModel status;
  final UserModel user;

  RegisterModel({
    required this.status,
    required this.user,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: StatusModel.fromJson(json['status']),
      user: UserModel.fromJson(json['data']),
    );
  }
}
