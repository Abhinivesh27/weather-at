import 'package:bloc_learn/weather/bloc/weather_bloc.dart';
import 'package:bloc_learn/weather/data/api.dart';
import 'package:bloc_learn/weather/data/utils/weather_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(
      GetWeatherEvent(
        location: Location(lat: '11.4680676', lng: '77.6433943'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1565C0), // Dark blue
              Color(0xFF64B5F6), // Light blue
            ],
          ),
        ),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is LoadingWeatherData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoadedWeatherData) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Location and Settings Row
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                '${state.address.city}, ${state.address.country}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.settings, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    // Weather Icon and Temperature
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            OpenMeteoWeatherMapper.getWeatherInfo(state.weatherData.current.weatherCode).icon,
                            size: 120,
                            color: OpenMeteoWeatherMapper.getWeatherInfo(state.weatherData.current.weatherCode).color,
                          ),
                          SizedBox(height: 20),
                          Text(
                            '${state.weatherData.current.temperature2M}°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            OpenMeteoWeatherMapper.getWeatherInfo(state.weatherData.current.weatherCode).description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Feels like ${state.weatherData.current.apparentTemperature}°C',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Weather Details Card
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeatherDetail(
                              Icons.water_drop, '${state.weatherData.current.relativeHumidity2M}%', 'Humidity'),
                          _buildWeatherDetail(Icons.air, '${state.weatherData.current.windSpeed10M} km/h', 'Wind'),
                          _buildWeatherDetail(
                              Icons.wind_power, '${state.weatherData.current.windDirection10M}°', 'Wind Dirction'),
                        ],
                      ),
                    ),

                    // Forecast Button
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: Text(
                          '7-Day Forecast',
                          style: TextStyle(
                            color: Color(0xFF1565C0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is ErrorLoadingWeatherData) {}

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
