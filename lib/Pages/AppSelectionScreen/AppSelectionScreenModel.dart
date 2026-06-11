import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Services/Device%20Services/AppListingService/IInstalledAppsService.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IIsarService.dart';
import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';
import 'package:get_it/get_it.dart';

class AppSelectionScreenModel {
    final ISharedPreferenceService sharedPreferenceService =
      GetIt.I<ISharedPreferenceService>();
  final db = GetIt.I<IIsarService>();
  final IInstalledAppsService platformService =
      GetIt.I<IInstalledAppsService>();
  List<BlockedAppBO> blockedAppsList = [];
  void setBlockedAppsList(List<BlockedAppBO> blockedAppsList) {
    this.blockedAppsList = blockedAppsList;
  }
}
