import 'package:bloc_learn/weather/data/model.dart';

import 'api.dart';

class WeatherRepository {
  Future<WeatherData?> getWeatherData(Location location) async {
    var response = await WeatherApiService().getWeatherData(location);
    if (response.isNotEmpty) {
      WeatherData data = WeatherData.fromRawJson(response);
      return data;
    }
    return null;
  }
}
