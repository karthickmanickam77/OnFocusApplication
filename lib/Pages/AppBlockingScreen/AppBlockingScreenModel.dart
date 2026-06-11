import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Services/Device%20Services/AppListingService/IInstalledAppsService.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IIsarService.dart';
import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';

import 'package:get_it/get_it.dart';

class AppBlockingScreenModel {
  final IInstalledAppsService platformService =
      GetIt.I<IInstalledAppsService>();
  final ISharedPreferenceService sharedPreferenceService =
      GetIt.I<ISharedPreferenceService>();
  final db = GetIt.I<IIsarService>();
  List<BlockedAppBO> blockedAppsList = [];
  bool? isSmartBlockEnable;

  void setisSmartBlockEnable(bool value) {
    isSmartBlockEnable = value;
  }

  void setBlockedAppsList(List<BlockedAppBO> blockedAppsList) {
    this.blockedAppsList = blockedAppsList;
  }
}
