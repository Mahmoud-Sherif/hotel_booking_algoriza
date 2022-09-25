import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repo.dart';

class RegisterUseCase extends UseCase<RegisterModel, RegisterParams> {
  final AuthRepository authRepo;

  RegisterUseCase({required this.authRepo});

  @override
  Future<Either<Failure, RegisterModel>> call(RegisterParams params) =>
      authRepo.register(params);
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirm,
      };
}
