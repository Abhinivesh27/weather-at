import 'package:flutter/material.dart';

class WeatherInfo {
  final IconData icon;
  final String description;
  final Color color;

  WeatherInfo({
    required this.icon,
    required this.description,
    required this.color,
  });
}

class OpenMeteoWeatherMapper {
  static WeatherInfo getWeatherInfo(int weatherCode) {
    switch (weatherCode) {
      // Clear conditions
      case 0:
        return WeatherInfo(
          icon: Icons.wb_sunny,
          description: 'Clear sky',
          color: Colors.yellow,
        );
      
      // Partly cloudy
      case 1:
        return WeatherInfo(
          icon: Icons.wb_cloudy,
          description: 'Mainly clear',
          color: Colors.orange,
        );
      case 2:
        return WeatherInfo(
          icon: Icons.wb_cloudy,
          description: 'Partly cloudy',
          color: Colors.orange,
        );
      case 3:
        return WeatherInfo(
          icon: Icons.cloud,
          description: 'Overcast',
          color: Colors.grey,
        );
      
      // Fog conditions
      case 45:
      case 48:
        return WeatherInfo(
          icon: Icons.cloud,
          description: 'Foggy',
          color: Colors.blueGrey,
        );
      
      // Drizzle
      case 51:
        return WeatherInfo(
          icon: Icons.grain,
          description: 'Light drizzle',
          color: Colors.lightBlue,
        );
      case 53:
        return WeatherInfo(
          icon: Icons.grain,
          description: 'Moderate drizzle',
          color: Colors.lightBlue,
        );
      case 55:
        return WeatherInfo(
          icon: Icons.grain,
          description: 'Dense drizzle',
          color: Colors.lightBlue,
        );
      
      // Freezing Drizzle
      case 56:
      case 57:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Freezing drizzle',
          color: Colors.lightBlue,
        );
      
      // Rain
      case 61:
        return WeatherInfo(
          icon: Icons.beach_access,
          description: 'Slight rain',
          color: Colors.blue,
        );
      case 63:
        return WeatherInfo(
          icon: Icons.beach_access,
          description: 'Moderate rain',
          color: Colors.blue,
        );
      case 65:
        return WeatherInfo(
          icon: Icons.beach_access,
          description: 'Heavy rain',
          color: Colors.blue,
        );
      
      // Freezing Rain
      case 66:
      case 67:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Freezing rain',
          color: Colors.blue,
        );
      
      // Snow
      case 71:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Slight snow',
          color: Colors.white,
        );
      case 73:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Moderate snow',
          color: Colors.white,
        );
      case 75:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Heavy snow',
          color: Colors.white,
        );
      case 77:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Snow grains',
          color: Colors.white,
        );
      
      // Rain showers
      case 80:
      case 81:
      case 82:
        return WeatherInfo(
          icon: Icons.beach_access,
          description: 'Rain showers',
          color: Colors.blue,
        );
      
      // Snow showers
      case 85:
      case 86:
        return WeatherInfo(
          icon: Icons.ac_unit,
          description: 'Snow showers',
          color: Colors.white,
        );
      
      // Thunderstorm
      case 95:
        return WeatherInfo(
          icon: Icons.thunderstorm,
          description: 'Thunderstorm',
          color: Colors.deepPurple,
        );
      
      // Thunderstorm with hail
      case 96:
      case 99:
        return WeatherInfo(
          icon: Icons.thunderstorm,
          description: 'Thunderstorm with hail',
          color: Colors.deepPurple,
        );

      default:
        return WeatherInfo(
          icon: Icons.question_mark,
          description: 'Unknown',
          color: Colors.grey,
        );
    }
  }
}