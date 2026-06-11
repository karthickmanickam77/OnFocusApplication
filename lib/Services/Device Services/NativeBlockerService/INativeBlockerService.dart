import 'package:cookbook/BOs/RestrictedAppsBO/RestrictedAppsBO.dart';

abstract class INativeBlockerService {
  Future<void> updateRestrictedApps(
      List<RestrictedAppsBO> packageNames) async {}
}
