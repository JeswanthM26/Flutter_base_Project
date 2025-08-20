import 'package:flutter_base_pro/core/constants/apz_api_constants.dart';
import 'package:flutter_base_pro/core/utils/apz_api_service.dart';
import 'package:flutter_base_pro/data/enums/apz_api_enums.dart';
// import 'package:http/http.dart' as http;


class WeatherRepository {
  final ApiService apiService;

  WeatherRepository(this.apiService);

  Future<Map<String, dynamic>> getWeather(String city) async {
    final response = await apiService.request(
      url: ApiConstants.openWeatherBaseUrl,
      method: HttpMethod.get,
      queryParams: {
        "q": city,
        "appid": ApiConstants.apiKey,
        "units": "metric",
      },
    );
    return response;
  }
}
