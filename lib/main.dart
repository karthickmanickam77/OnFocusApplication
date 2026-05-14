import 'package:cookbook/Helpers/AppConstants/AppConstants.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/IUniversityServices.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/UniversityServices.dart';
import 'package:cookbook/app.dart';
import 'package:cookbook/main.reflectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'BOs/UniversityBO/UniversityBO.mapper.g.dart' as universityBO;
import 'package:get_it/get_it.dart';

void main() {
  ResponsiveUI.baseHeight = 852;
  ResponsiveUI.baseWidth = 393;
  WidgetsFlutterBinding.ensureInitialized();
  // GetIt.instance.registerSingleton<IUniversityServices>(UniversityServices());
  // initializeReflectable();
  // universityBO.initializeJsonMapper();

  GetIt.I.registerSingleton<IUniversityServices>(UniversityServices());
  // Now retrieve the instance and test it
  final universityServices = GetIt.I<IUniversityServices>();
  // print("-------->");
  // print(universityServices);

  initializeReflectable();
  universityBO.initializeJsonMapper();
  MapboxOptions.setAccessToken(AppConstants.baseHeight.toString());
  runApp(const ProviderScope(child: MyApp()));
}
