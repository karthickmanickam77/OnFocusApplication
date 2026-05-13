import 'package:cookbook/Pages/FocusModeScreen/FocusMode.dart';
import 'package:cookbook/Pages/HomeScreen/HomeScreen.dart';
import 'package:cookbook/Pages/InsightScreen/InsightsScreen.dart';
import 'package:cookbook/Pages/MainScreen/MainScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cookbook/Pages/Reusables/CustomBottomNavBar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final vm = ref.watch(mainScreenProvider);

    final pages = [
      HomeScreen(),
      InsightsScreen(),
      FocusModeScreen(),
      Text('data'),
    ];

    return Scaffold(
      body: pages[vm.currentIndex],
      bottomNavigationBar: CustomBottomBar(
        elements: vm.elements,
        currentIndex: vm.currentIndex,
        onTap: (index) {
          vm.changeIndex(index);
        },
      ),
    );
  }
}
