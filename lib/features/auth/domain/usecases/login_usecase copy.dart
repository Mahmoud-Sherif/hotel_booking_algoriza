import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repo.dart';

class LoginUseCase extends UseCase<LoginModel, LoginParams> {
  final AuthRepository authRepo;

  LoginUseCase({required this.authRepo});

  @override
  Future<Either<Failure, LoginModel>> call(LoginParams params) =>
      authRepo.login(params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
