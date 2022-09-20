import 'package:dio/dio.dart';

class DioHelper {
  static const String _API_KEY = 'bb35f7c7647c44ffbba00720220809';
  static const String _BASE_URL =
      ' http://api.weatherapi.com/v1/forecast.json?';

  static Dio _dio = Dio()

    // ..options.baseUrl = _BASE_URL
    ..options.validateStatus = (v) => v! < 500;

  // http://api.openweathermap.org/data/2.5/weather? lat=31&lon=31 &appid=be2acbcfe99b5fe0e4e59c3b35c3dd23
  static Future<Response<dynamic>> post(String path,
      {Map<String, dynamic>? formData,
      dynamic body,
      Function(int, int)? onSendProgress}) {
    final response = _dio.post('key=' + _API_KEY + path,
        data: formData != null ? formData : body,
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> get(String path) {
    final response = _dio.post(
        'http://api.weatherapi.com/v1/forecast.json?key=bb35f7c7647c44ffbba00720220809&$path&days=7&aqi=no&alerts=no');
    return response;
  }

  static Future<Response<dynamic>> testApi() {
    final response = _dio.get(
      'http://api.mahmoudtaha.com/api/get-bookings?type=cancelled&count=10',
      options: Options(
        headers: {
          "token":
              "DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u"
        },
      ),
    );
    return response;
  }
}
