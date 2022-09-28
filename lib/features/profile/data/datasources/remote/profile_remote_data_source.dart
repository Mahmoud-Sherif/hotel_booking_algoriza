import 'package:flutter/cupertino.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';

import '../../../domain/usecases/get_profile_data_usecase copy.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import '../../models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileModel> updateProfile(ProfileParams registerParams);
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final ApiConsumer apiConsumer;
  ProfileRemoteDatasourceImpl({required this.apiConsumer});
  @override
  Future<ProfileModel> updateProfile(ProfileParams profileParams) async {
    final response = await apiConsumer.post(
      EndPoints.updateProfile,
      body: profileParams.toJson(),
    );
    return ProfileModel.fromJson(response);
  }


  @override
  Future<ProfileModel> getProfile() async{
    final response = await apiConsumer.get(
      EndPoints.profileInfo,
    );
    debugPrint("ffff ${response}" );
    return ProfileModel.fromJson(response);
  }

}
