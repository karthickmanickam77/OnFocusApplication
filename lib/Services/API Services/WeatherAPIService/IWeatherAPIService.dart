import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';
import 'package:cookbook/Helpers/ServiceResult.dart';

abstract class IWeatherAPIService {
  Future<ServiceResult<WeatherBO>> getCurrentWeather({
    required double latitude,
    required double longitude,
  });
}
