import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';
import 'package:hotel_booking_algoriza/features/profile/data/models/profile_model.dart';

import '../../../../core/error/failures.dart';
import '../usecases/get_profile_data_usecase copy.dart';
import '../usecases/update_profile_usecase.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();

  Future<Either<Failure, ProfileModel>> updateProfile(
      ProfileParams profileParams);
}
