part of 'weather_bloc.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class LoadingWeatherData extends WeatherState {}

final class LoadedWeatherData extends WeatherState {
  final WeatherData weatherData;
  final Location location;
  final Address address;
  LoadedWeatherData({required this.weatherData, required this.location,required this.address, });
}

final class ErrorLoadingWeatherData extends WeatherState {
  final String errorMessage;

  ErrorLoadingWeatherData({required this.errorMessage});
}