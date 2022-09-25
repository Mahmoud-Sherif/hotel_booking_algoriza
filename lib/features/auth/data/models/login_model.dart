import 'package:hotel_booking_algoriza/core/models/status_model.dart';
import 'package:hotel_booking_algoriza/core/models/user_model.dart';

class LoginModel {
  final StatusModel status;
  final UserModel? user;

  LoginModel({
    required this.status,
    this.user,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: StatusModel.fromJson(json['status']),
      user: UserModel.fromJson(json['data']),
    );
  }
}
