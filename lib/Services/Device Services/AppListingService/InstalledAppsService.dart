import 'package:cookbook/Services/Device%20Services/AppListingService/IInstalledAppsService.dart';
import 'package:flutter/services.dart';

class InstalledAppsService implements IInstalledAppsService {

  final MethodChannel platform =
      const MethodChannel('com.focusflow/apps');

  Future<List<dynamic>> getInstalledApps() async {

    final apps =
        await platform.invokeMethod('getInstalledApps');
    return apps;
  }
}