import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/login_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_repo.dart';

class GetProfileUseCase implements  UseCase<ProfileModel, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileModel>> call(NoParams params) =>
      profileRepository.getProfile();
}

class GetProfileParams {

}
