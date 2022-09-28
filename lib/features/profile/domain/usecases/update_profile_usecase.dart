import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_repo.dart';

  class UpdateProfileUseCase extends UseCase<ProfileModel, ProfileParams> {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileModel>> call(ProfileParams params) =>
      profileRepository.updateProfile(params);
}

  class ProfileParams {
  final String name;
  final String email;
  final String image;

  ProfileParams({
    required this.name,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
      };
}
