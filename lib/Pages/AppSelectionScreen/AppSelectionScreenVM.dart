import 'dart:typed_data';

import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/AppSelectionScreen/AppSelectionScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final appselectionscreenprovider =
    ChangeNotifierProvider.autoDispose((ref) => AppSelectionScreenVM());

class AppSelectionScreenVM extends AppSelectionScreenModel
    with ChangeNotifier, NavigationMixin {
  AppSelectionScreenVM() {
    updateAppsList();
  }
  Future<void> updateAppsList() async {
    if (await sharedPreferenceService.getAppsStoredStatus()) {
      List<BlockedAppBO> appsList =
          await db.isar.blockedAppBOs.where().findAll();
      setBlockedAppsList(appsList);
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
    }
    notifyListeners();
  }

  Future<void> updateDB() async {
    await db.isar.writeTxn(() async {
      await db.isar.blockedAppBOs.putAllByIndex(
        'packageName',
        blockedAppsList.toList(),
      );
    });
    sharedPreferenceService.setAppsStoredStatus(true);
    navigateToBlockingPage();
  }

  void navigateToBlockingPage() {
    addNavigationToStream(
        navigate: NavigatorPopAndPush(
            pageConfig: Pages.appBlockingPageConfig, data: null));
  }

  bool getCheckBoxState(String packageName) {
    final app = blockedAppsList.firstWhere(
      (e) => e.packageName == packageName,
    );
    return (app.isChecked);
  }

  void navigationPop() {
    addNavigationToStream(navigate: NavigatorPop(data: null));
  }

  void changeCheckBox(String packageName) {
    final app = blockedAppsList.firstWhere(
      (e) => e.packageName == packageName,
    );

    app.isChecked = !(app.isChecked);

    notifyListeners();
  }
}
