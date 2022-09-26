import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/features/auth/data/models/register_model.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/login_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/register_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../data/models/login_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit of(context) => BlocProvider.of(context);
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(AuthInitial());
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  Future<void> login(LoginParams params) async {
    emit(LoginLodaing());
    Either<Failure, LoginModel> response = await loginUseCase(params);
    emit(
      response.fold(
        (failure) => LoginError(msg: _mapFailureToMsg(failure)),
        (loginModel) {
          return LoginLoaded(loginModel: loginModel);
        },
      ),
    );
  }

  Future<void> register(RegisterParams params) async {
    emit(RegisterLodaing());
    Either<Failure, RegisterModel> response = await registerUseCase(params);
    emit(
      response.fold(
        (failure) => RegisterError(msg: _mapFailureToMsg(failure)),
        (registerModel) {
          return RegisterLoaded(registerModel: registerModel);
        },
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
