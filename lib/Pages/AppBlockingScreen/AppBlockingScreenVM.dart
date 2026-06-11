import 'dart:typed_data';

import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/BOs/RestrictedAppsBO/RestrictedAppsBO.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/AppBlockingScreen/AppBlockingScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final appblockingscreenprovider =
    ChangeNotifierProvider.autoDispose((ref) => AppBlockingScreenVM());

class AppBlockingScreenVM extends AppBlockingScreenModel
    with ChangeNotifier, NavigationMixin {
  AppBlockingScreenVM() {
    updateAppsList();
  }

  void navigatePop() {
    addNavigationToStream(navigate: NavigatorPop(data: null));
  }

  Future<void> updateAppsList() async {
    if (await sharedPreferenceService.getAppsStoredStatus()) {
      List<BlockedAppBO> appsList =
          await db.isar.blockedAppBOs.filter().isCheckedEqualTo(true).findAll();
      setBlockedAppsList(appsList.cast<BlockedAppBO>());
    } else {
      var app = await platformService.getInstalledApps();

      List<BlockedAppBO> appsList = app.map<BlockedAppBO>((apps) {
        return BlockedAppBO(
          appName: apps['appName'] ?? '',
          packageName: apps['packageName'] ?? '',
          isBlocked: false,
          icon: apps['icon'] != null
              ? Uint8List.fromList(
                  List<int>.from(apps['icon']),
                )
              : null,
        );
      }).toList();
      await db.isar.writeTxn(() async {
        await db.isar.blockedAppBOs.putAllByIndex(
          'packageName',
          appsList,
        );
      });
      sharedPreferenceService.setAppsStoredStatus(true);
      setBlockedAppsList(appsList);
    }

    notifyListeners();
  }

  void navigateToAppSelectionScreen() {
    addNavigationToStream(
        navigate: NavigatorPopAndPush(
            pageConfig: Pages.appsSelectionPageConfig, data: null));
  }

  bool getToggleState(String packageName) {
    final app = blockedAppsList.firstWhere(
      (e) => e.packageName == packageName,
    );
    return (app.isBlocked);
  }

  void changeToggle(String packageName) async {
    final app = blockedAppsList.firstWhere(
      (e) => e.packageName == packageName,
    );

    app.isBlocked = !(app.isBlocked);
    // await db.isar.writeTxn(() async {
    //   await db.isar.blockedAppBOs.putAllByIndex(
    //     'packageName',
    //     blockedAppsList,
    //   );
    // });
    notifyListeners();
  }

  bool getSmartBlockState() {
    return isSmartBlockEnable ?? false;
  }

  void changeSMartBlockState() {
    setisSmartBlockEnable(!getSmartBlockState());
    notifyListeners();
  }
}
