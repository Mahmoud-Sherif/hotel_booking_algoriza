import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';

import '../../../../core/error/failures.dart';
import '../usecases/login_usecase.dart';
import '../usecases/register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login(LoginParams loginParams);

  Future<Either<Failure, RegisterModel>> register(
      RegisterParams registerParams);
}
