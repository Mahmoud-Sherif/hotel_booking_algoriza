import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/strings_manager.dart';

abstract class AuthLocalDataSource {
  Future<void> cachToken(String token);
  bool get isLogged;
  String? get token;
  // set isLogged(bool value);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> cachToken(String token) {
    return sharedPreferences.setString(AppStrings.cachedToken, token);
  }

  @override
  bool get isLogged => sharedPreferences.containsKey(AppStrings.cachedToken);

  @override
  String? get token => sharedPreferences.getString(AppStrings.cachedToken);
  // @override
  // set isLogged(bool value) => !isLogged;
}
