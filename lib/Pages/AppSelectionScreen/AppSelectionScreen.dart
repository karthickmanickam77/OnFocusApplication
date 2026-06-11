import 'dart:async';
import 'dart:typed_data';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Helpers/Utilities/Local_Utils.dart';
import 'package:cookbook/Pages/AppSelectionScreen/AppSelectionScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSelectionScreen extends ConsumerStatefulWidget {
  const AppSelectionScreen({super.key});

  @override
  ConsumerState<AppSelectionScreen> createState() => _AppSelectionScreenState();
}

class _AppSelectionScreenState extends ConsumerState<AppSelectionScreen> {
  StreamSubscription? navigationSubscription;
  @override
  void initState() {
    super.initState();
    navigationSubscription = ref
        .read(appselectionscreenprovider)
        .navigationStream
        .stream
        .listen((event) {
      if (event is NavigatorPop) {
        context.pop(
          data: event.data,
        );
      } else if (event is NavigatorPopAndPush) {
        context.popAndPush(pageConfig: event.pageConfig, data: event.data);
      }
    });
  }

  @override
  void dispose() {
    navigationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final vm = ref.watch(appselectionscreenprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ResponsiveUI.w(10, context),
            ),
            GestureDetector(
                onTap: () {
                  vm.navigationPop();
                },
                child: Icon(Icons.close)),
            Spacer(),
            Text(
              lang.selectedApps,
              style: TextStyle(
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w700,
                  fontSize: ResponsiveUI.sp(
                      LocaleUtils.isTamil(context) ? 13 : 22, context)),
            ),
            Spacer()
          ],
        ),
      ),
      body: (vm.blockedAppsList.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(
              color: Color(0xff5140F2),
            ))
          : Padding(
              padding: EdgeInsets.only(bottom: ResponsiveUI.h(48, context)),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: vm.blockedAppsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveUI.w(16, context),
                          vertical: ResponsiveUI.h(8, context)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (vm.blockedAppsList[index].icon != null)
                              ? Image.memory(
                                  Uint8List.fromList(
                                      vm.blockedAppsList[index].icon ?? []),
                                  height: ResponsiveUI.h(35, context),
                                  width: ResponsiveUI.w(35, context),
                                )
                              : Icon(Icons.android),
                          SizedBox(
                            width: ResponsiveUI.w(16, context),
                          ),
                          Text(
                            vm.blockedAppsList[index].appName,
                            style: TextStyle(
                                fontFamily: 'SFPro',
                                fontSize: ResponsiveUI.sp(18, context),
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)),
                          ),
                          const Expanded(child: SizedBox()),
                          Checkbox(
                              value: vm.blockedAppsList[index].isChecked,
                              onChanged: (value) {
                                vm.changeCheckBox(
                                    vm.blockedAppsList[index].packageName);
                              })
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ResponsiveUI.w(20, context)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5140F2),
                fixedSize: Size(
                    ResponsiveUI.w(320, context), ResponsiveUI.h(50, context))),
            onPressed: () {
              vm.updateDB();
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  lang.select,
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: ResponsiveUI.sp(
                          LocaleUtils.isTamil(context) ? 18 : 22, context)),
                ),
              ),
            )),
      ),
    );
  }
}
