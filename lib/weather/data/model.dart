import 'package:meta/meta.dart';
import 'dart:convert';

class WeatherData {
    final double latitude;
    final double longitude;
    final double generationtimeMs;
    final int utcOffsetSeconds;
    final String timezone;
    final String timezoneAbbreviation;
    final double elevation;
    final CurrentUnits currentUnits;
    final Current current;

    WeatherData({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.currentUnits,
        required this.current,
    });

    factory WeatherData.fromRawJson(String str) => WeatherData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnits.fromJson(json["current_units"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    final String time;
    final int interval;
    final double temperature2M;
    final int relativeHumidity2M;
    final double apparentTemperature;
    final int isDay;
    final int weatherCode;
    final double windSpeed10M;
    final int windDirection10M;

    Current({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.relativeHumidity2M,
        required this.apparentTemperature,
        required this.isDay,
        required this.weatherCode,
        required this.windSpeed10M,
        required this.windDirection10M,
    });

    factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"]?.toDouble(),
        isDay: json["is_day"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
        windDirection10M: json["wind_direction_10m"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
    };
}

class CurrentUnits {
    final String time;
    final String interval;
    final String temperature2M;
    final String relativeHumidity2M;
    final String apparentTemperature;
    final String isDay;
    final String weatherCode;
    final String windSpeed10M;
    final String windDirection10M;

    CurrentUnits({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.relativeHumidity2M,
        required this.apparentTemperature,
        required this.isDay,
        required this.weatherCode,
        required this.windSpeed10M,
        required this.windDirection10M,
    });

    factory CurrentUnits.fromRawJson(String str) => CurrentUnits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        isDay: json["is_day"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"],
        windDirection10M: json["wind_direction_10m"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
    };
}
