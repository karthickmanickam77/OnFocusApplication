import 'package:cookbook/Helpers/AppConstants/AppConstants.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Services/API%20Services/MapboxAPIServices/DirectionService.dart';
import 'package:cookbook/Services/API%20Services/MapboxAPIServices/IDirectionService.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/IUniversityServices.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/UniversityServices.dart';
import 'package:cookbook/Services/API%20Services/WeatherAPIService/IWeatherAPIService.dart';
import 'package:cookbook/Services/API%20Services/WeatherAPIService/WeatherAPIService.dart';
import 'package:cookbook/Services/Device%20Services/AppListingService/IInstalledAppsService.dart';
import 'package:cookbook/Services/Device%20Services/AppListingService/InstalledAppsService.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IIsarService.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IsarService.dart';
import 'package:cookbook/Services/Device%20Services/LocationService/ILocationService.dart';
import 'package:cookbook/Services/Device%20Services/LocationService/LocationService.dart';
import 'package:cookbook/Services/Device%20Services/NativeBlockerService/INativeBlockerService.dart';
import 'package:cookbook/Services/Device%20Services/NativeBlockerService/NativeBlockerService.dart';
import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';
import 'package:cookbook/Services/Device%20Services/SharedPreference/SharedPreference.dart';
import 'package:cookbook/Services/Platform%20Services/ActivityRecommendationService/ActivityRecommendationService.dart';
import 'package:cookbook/Services/Platform%20Services/ActivityRecommendationService/IActivityRecommendationService.dart';
import 'package:cookbook/app.dart';
// import 'package:cookbook/main.reflectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ResponsiveUI.baseHeight = 852;
  ResponsiveUI.baseWidth = 393;
  final IIsarService isarService = IsarService();

  await isarService.init();

  GetIt.I.registerSingleton<IIsarService>(
    isarService,
  );
  GetIt.I.registerSingleton<ISharedPreferenceService>(
    SharedPreferenceService(),
  );
  GetIt.I.registerSingleton<INativeBlockerService>(NativeBlockerService());
  // GetIt.I.registerSingleton<IUniversityServices>(UniversityServices());
  GetIt.I.registerSingleton<IInstalledAppsService>(InstalledAppsService());
  GetIt.I.registerSingleton<ILocationService>(LocationService());
  GetIt.I.registerSingleton<IDirectionService>(DirectionService());
  GetIt.I.registerSingleton<IWeatherAPIService>(WeatherAPIService());
  GetIt.I.registerSingleton<IRecommendationService>(RecommendationService());
  // initializeReflectable();
  MapboxOptions.setAccessToken(AppConstants.mapboxapiid);
  runApp(const ProviderScope(child: MyApp()));
}
