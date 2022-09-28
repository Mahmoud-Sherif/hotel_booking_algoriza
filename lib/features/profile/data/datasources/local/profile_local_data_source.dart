import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<void> cachToken(String token);

  Future<ProfileModel> getProfileData();

  Future<void> cacheUserData(ProfileModel profileModel);
// set isLogged(bool value);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cachToken(String token) {
    return sharedPreferences.setString(AppStrings.cachedToken, token);
  }

  @override
  bool get profileData => sharedPreferences.containsKey(AppStrings.cachedToken);

  Future<ProfileModel> getProfileData() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedToken);
    if (jsonString != null) {
      final cachedUserData =
          Future.value(ProfileModel.fromJson(json.decode(jsonString)));
      return cachedUserData;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserData(ProfileModel quote) {
    return sharedPreferences.setString(
      AppStrings.cachedUserData,
      json.encode(quote),
    );
  }

// @override
// set isLogged(bool value) => !isLogged;
}
