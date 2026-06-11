import 'package:cookbook/BOs/RestrictedAppsBO/RestrictedAppsBO.dart';
import 'package:cookbook/Services/Device Services/NativeBlockerService/INativeBlockerService.dart';
import 'package:flutter/services.dart';

class NativeBlockerService implements INativeBlockerService {
  final MethodChannel _channel = const MethodChannel('com.focusflow/apps');

  @override
  Future<void> updateRestrictedApps(
    List<RestrictedAppsBO> packageNames,
  ) async {
    final packages = packageNames.map((e) => e.packageName).toList();
    print("-----------------------rjongrongoernoenbneonbeon");
    print(packageNames);
    await _channel.invokeMethod(
      'updateRestrictedApps',
      packages,
    );
  }
}
