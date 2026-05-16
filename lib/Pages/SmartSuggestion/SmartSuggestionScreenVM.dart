import 'package:cookbook/BOs/ActivityTypeBO/ActivityTypeBO.dart';
import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';
import 'package:cookbook/Helpers/AppConstants/AppConstants.dart';
import 'package:cookbook/Helpers/ServiceResult.dart';
import 'package:cookbook/Pages/SmartSuggestion/SmartSuggestionScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' hide Position;

final smartsuggestionscreenprovider =
    ChangeNotifierProvider((ref) => SmartSuggestionScreenVM());

class SmartSuggestionScreenVM extends SmartSuggestionScreenModel
    with ChangeNotifier {
  SmartSuggestionScreenVM() {
    initialize();
  }
  void initialize() {
    setLocationSet(false);
    getLocationData();
    setMapExpand(false);
  }

  void updateMapExpand() {
    setMapExpand(!mapExpand!);
    notifyListeners();
  }

  Future<void> getLocationData() async {
    Position? currentposition =
        await deviceLocationService.getCurrentLocation();
    setDeviceCurrentPositionData(currentposition!);
    setLocationSet(true);
    getWeatherData();

    notifyListeners();
  }

  void getRecommendations() {
    if (weatherData == null) {
      return;
    }
    List<ActivityRecommendationBO> result =
        recommendationService.generateRecommendations(
            weatherBO: weatherData!, currentTime: DateTime.now());
    setRecommendationData(result);
  }

  Future<void> getWeatherData() async {
    try {
      if (devicecurrentPositionData == null) {
        print("Location is null");
        return;
      }

      ServiceResult<WeatherBO> result = await weatherService.getCurrentWeather(
        latitude: devicecurrentPositionData!.latitude,
        longitude: devicecurrentPositionData!.longitude,
      );

      print(result.statusCode);
      print(result.content);
      print(result.message);

      if (result.statusCode == ServiceStatusCode.OK && result.content != null) {
        setWeatherData(
          result.content!,
        );
        getRecommendations();

        notifyListeners();
      } else {
        print("Weather fetch failed");
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> drawRoute(dynamic mapboxMap) async {
    final dummyParkLat = 49.7680;
    final dummyParkLon = 6.6455;
    final userLocation = devicecurrentPositionData!;

    final routeCoordinates = await directionService.getRoute(
      startLat: userLocation.latitude,
      startLon: userLocation.longitude,
      endLat: dummyParkLat,
      endLon: dummyParkLon,
      accessToken: AppConstants.mapboxapiid,
    );
    print(userLocation.latitude);
    print(userLocation.longitude);

    List<mapbox.Position> points =
        routeCoordinates.map<mapbox.Position>((point) {
      return mapbox.Position(
        point[0].toDouble(),
        point[1].toDouble(),
      );
    }).toList();

    final polylineManager =
        await mapboxMap?.annotations.createPolylineAnnotationManager();

    await polylineManager?.create(
      mapbox.PolylineAnnotationOptions(
        geometry: LineString(
          coordinates: points,
        ),
        lineColor: Colors.blue.value,
        lineWidth: 6.0,
      ),
    );
  }
}
