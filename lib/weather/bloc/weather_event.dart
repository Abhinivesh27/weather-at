part of 'weather_bloc.dart';


sealed class WeatherEvent {}


final class GetWeatherEvent extends WeatherEvent {
  final Location location;

  GetWeatherEvent({required this.location});
  
}
