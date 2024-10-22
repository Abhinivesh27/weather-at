import 'package:bloc_learn/weather/data/api.dart';
import 'package:bloc_learn/weather/data/model.dart';
import 'package:bloc_learn/weather/data/repo.dart';
import 'package:bloc_learn/weather/data/utils/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(getWeatherHandler);
  }
}


getWeatherHandler(event, emit) async {
      emit(LoadingWeatherData());
      var position = await LocationService.getCurrentLocation();
      Location location = Location(lat: position!.latitude.toString(), lng: position.longitude.toString());
      Address address = await LocationService.getAddressFromCoordinates(position.latitude, position.longitude);
      var weatherData = await WeatherRepository().getWeatherData(location);

      if(weatherData != null) {
          emit(LoadedWeatherData(weatherData: weatherData, location: location, address: address));
      } else {
        emit(ErrorLoadingWeatherData(errorMessage: 'Unable to load wather data'));
      }
    }