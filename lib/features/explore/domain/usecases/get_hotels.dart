import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/hotels_model.dart';
import '../repositories/auth_repo.dart';

class GetHotelsUseCase extends UseCase<HotelsModel, HotleParams> {
  final ExploreRepo exploreRepo;
  GetHotelsUseCase({required this.exploreRepo});
  @override
  Future<Either<Failure, HotelsModel>> call(HotleParams params) =>
      exploreRepo.getHotels(params);
}

class HotleParams {
  final String count;
  final String page;

  HotleParams({
    required this.count,
    required this.page,
  });

  Map<String, dynamic> toJson() => {
        "count": count,
        "page": page,
      };
}
