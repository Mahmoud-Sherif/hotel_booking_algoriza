import 'package:dartz/dartz.dart';
import 'package:hotel_booking_algoriza/core/error/failures.dart';
import 'package:hotel_booking_algoriza/core/usecases/usecase.dart';
import 'package:hotel_booking_algoriza/features/lang/domain/repositories/lang_repo.dart';



class GetSavedLangUseCase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}