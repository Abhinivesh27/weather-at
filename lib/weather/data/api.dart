//11.4680676,77.6433943 - jambai

//https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m
import 'package:http/http.dart' as http;

class Location{
  final String lat;
  final String lng;

  Location({required this.lat, required this.lng});
}

class WeatherApiService {

  Future<String> getWeatherData(Location location) async {
      var response = await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=${location.lat}&longitude=${location.lng}&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,weather_code,wind_speed_10m,wind_direction_10m&timezone=auto&forecast_days=1"));
      return response.body;
  }

}