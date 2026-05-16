import 'package:cookbook/BOs/ActivityTypeBO/ActivityTypeBO.dart';
import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';
import 'package:cookbook/Services/API%20Services/MapboxAPIServices/IDirectionService.dart';
import 'package:cookbook/Services/API%20Services/WeatherAPIService/IWeatherAPIService.dart';
import 'package:cookbook/Services/Device%20Services/LocationService/ILocationService.dart';
import 'package:cookbook/Services/Platform%20Services/ActivityRecommendationService/IActivityRecommendationService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

ILocationService deviceLocationService = GetIt.I.get<ILocationService>();
IDirectionService directionService = GetIt.I.get<IDirectionService>();
IWeatherAPIService weatherService = GetIt.I.get<IWeatherAPIService>();
IRecommendationService recommendationService =
    GetIt.I.get<IRecommendationService>();

class SmartSuggestionScreenModel {
  Position? devicecurrentPositionData;
  bool? locationSet;
  bool? mapExpand;
  WeatherBO? weatherData;
  List<ActivityRecommendationBO>? recommendationData;

  void setRecommendationData(recommendationData) {
    this.recommendationData = recommendationData;
  }

  void setWeatherData(WeatherBO weatherData) {
    this.weatherData = weatherData;
  }

  void setLocationSet(bool value) {
    locationSet = value;
  }

  void setMapExpand(bool value) {
    mapExpand = value;
  }

  void setDeviceCurrentPositionData(Position? data) {
    devicecurrentPositionData = data;
  }
}
