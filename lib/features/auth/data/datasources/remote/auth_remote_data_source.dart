import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterModel> register(RegisterParams registerParams);
  Future<LoginModel> login(LoginParams loginParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiConsumer apiConsumer;
  AuthRemoteDatasourceImpl({required this.apiConsumer});
  @override
  Future<RegisterModel> register(
    RegisterParams registerParams,
  ) async {
    final response = await apiConsumer.post(
      EndPoints.authRegister,
      body: registerParams.toJson(),
    );
    return RegisterModel.fromJson(response);
  }

  @override
  Future<LoginModel> login(LoginParams loginParams) async {
    final response = await apiConsumer.post(
      EndPoints.authLogin,
      body: loginParams.toJson(),
    );
    return LoginModel.fromJson(response);
  }
}
