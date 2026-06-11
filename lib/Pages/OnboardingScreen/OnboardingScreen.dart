import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/OnboardingScreen/OnboardingScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "lib/Helpers/Images/onboarding_Image1.png",
      "title": "Focus Better. Live Better",
      "description":
          "FocusFlow helps you reduce distractions, understand your habits and build a healthier you",
    },
    {
      "image": "lib/Helpers/Images/weather_sunny.png",
      "title": "Block Distractions",
      "description":
          "Take control of your screen time and avoid unnecessary distractions",
    },
    {
      "image": "lib/Helpers/Images/breathing.png",
      "title": "Track Your Progress",
      "description":
          "Monitor your focus sessions and improve your productivity daily",
    },
  ];
   StreamSubscription? navigationsubscription;
  @override
  void initState() {
    super.initState();
    navigationsubscription =
        ref.read(onboardingscreenprovider).navigationStream.stream.listen((event) {
      if (event is NavigatorPopAndPush) {
        context.popAndPush(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      } else if (event is NavigatorPop) {
        context.pop();
      }
    });
  }

  @override
  void dispose() {
    navigationsubscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(onboardingscreenprovider);
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),

            /// CAROUSEL
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  vm.updateIndex(index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        /// IMAGE
                        Expanded(
                          flex: 5,
                          child: Image.asset(
                            onboardingData[index]["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// TITLE
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// DESCRIPTION
                        Text(
                          onboardingData[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.6,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const Spacer(),

                        /// INDICATOR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (indicatorIndex) {
                              final isActive = vm.getIndex() == indicatorIndex;

                              return GestureDetector(
                                onTap: (){
                                  vm.updateIndex(indicatorIndex);
                                  _pageController.jumpToPage(
                                    vm.getIndex()
                                );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: isActive ? 26 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? const Color(0xFF5B3FFF)
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5B3FFF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (vm.getIndex() < onboardingData.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                                vm.updateIndex(vm.getIndex()+1);
                              }else{
                                vm.navigateToNextScreen();
                              }
                              
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
