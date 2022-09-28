import 'dart:io';
import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_booking_algoriza/features/profile/domain/usecases/get_profile_data_usecase%20copy.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../injection_container.dart';
import '../../../auth/data/datasources/local/autl_local_data_source.dart';
import '../../data/models/profile_model.dart';
import '../../domain/usecases/update_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,

  }) : super(ProfileInitial());

  static ProfileCubit of(context) => BlocProvider.of(context);

  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  //final ApiConsumer apiConsumer;
  String token = "";

  Future<void> getProfileData() async {
    emit(UserProfileLodaing());

    Either<Failure, ProfileModel> response = await getProfileUseCase(NoParams());

    emit(
      response.fold(
            (failure) => GetProfileDateError(msg: _mapFailureToMsg(failure)),
            (profileModel) {
          //token = profileModel.user.token;
          return ProfileDataLoaded(profileModel: profileModel);
        },
      ),
    );
  }

  Future<void> updateProfile(ProfileParams params) async {
    emit(ProfileDataLodaing());
    Either<Failure, ProfileModel> response = await updateProfileUseCase(params);
    emit(
      response.fold(
            (failure) => UpdateProfileError(msg: _mapFailureToMsg(failure)),
            (profileModel) {
          return UpdatedDataLoaded(profileModel: profileModel);
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
  File? image;
  Future<File?> getImage() async {

    final picker = ImagePicker();

    var _pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500,  // <- reduce the image size
        maxWidth: 500);
    if(_pickedFile != null){
      image = File(_pickedFile.path);
    }
    uploadFile(filePath: image);
  }

  File? imageFile;
  Future<ProfileModel> uploadFile({ File? filePath, String? email,
    String? name, }) async {
    //String fileName = filePath.path.split('/').last;
    //try {
    FormData formData =
    FormData.fromMap({
      "name": name,
      "email": email,
      "image": await MultipartFile.fromFile(filePath!.path, filename: filePath.path.split('/').last),
    });

    Response response =
    await Dio().post(
      EndPoints.updateProfile,
      data: formData,
      options: Options(
          headers: <String, dynamic>{
            'token': sl<AuthLocalDataSource>().token,
          }
      ),

    );
    print(response.data);
    return ProfileModel.fromJson(response.data);
    // }on DioError catch (e) {
    //   return e.response!.data;
    // } catch(e){}
    //  return
  }


}
