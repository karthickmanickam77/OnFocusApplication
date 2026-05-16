import 'package:cookbook/Helpers/AppConstants/AppConstants.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/SmartSuggestion/DependentView/ReusableMapView.dart';
import 'package:cookbook/Pages/SmartSuggestion/DependentView/ReusableRecommendationCard.dart';
import 'package:cookbook/Pages/SmartSuggestion/SmartSuggestionScreenVM.dart';
import 'package:cookbook/Services/API%20Services/MapboxAPIServices/DirectionService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SmartSugesstionScreen extends ConsumerWidget {
  const SmartSugesstionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(smartsuggestionscreenprovider);

    MapboxMap? mapboxMap;

    return Scaffold(
      backgroundColor: Color(0xffFDFDFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            SizedBox(
              width: ResponsiveUI.w(26, context),
            ),
            Image.asset(
              "lib/Helpers/Images/backIcon.png",
              width: ResponsiveUI.w(9, context),
            ),
            SizedBox(
              width: ResponsiveUI.w(76, context),
            ),
            Text(
              'Smart Suggestions',
              style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          ],
        ),
      ),
      body: (!vm.locationSet!)
          ? Center(child: CircularProgressIndicator())
          : (vm.mapExpand!)
              ? ReusableMapView(
                  vm: vm,
                  mapboxMap: mapboxMap,
                )
              : Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUI.w(20, context)),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (vm.weatherData == null)
                          ? Container(
                              width: double.infinity,
                              height: ResponsiveUI.h(149, context),
                              child: Center(child: CircularProgressIndicator()))
                          : Container(
                              padding: EdgeInsets.only(
                                  top: ResponsiveUI.h(10, context),
                                  bottom: ResponsiveUI.h(24, context)),
                              // width: ResponsiveUI.w(353, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ResponsiveUI.r(8, context)),
                                color: Color(0xffD7ECFE).withOpacity(0.8),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "lib/Helpers/Images/weather_sunny.png",
                                    width: ResponsiveUI.w(138, context),
                                  ),
                                  SizedBox(
                                    width: ResponsiveUI.w(5, context),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text:
                                            '${vm.weatherData!.temperature_2m}°C\n',
                                        style: GoogleFonts.inter(
                                            height:
                                                ResponsiveUI.h(1.2, context),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                ResponsiveUI.sp(15, context),
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${vm.weatherData!.weatherText}\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: vm.weatherData!
                                                  .recommendationText),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: ResponsiveUI.h(26, context),
                      ),
                      Text(
                        'Recommended for you',
                        style: GoogleFonts.inter(
                            fontSize: ResponsiveUI.sp(15, context),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: ResponsiveUI.h(15, context),
                      ),
                      (vm.recommendationData == null)
                          ? CircularProgressIndicator()
                          : ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: ResponsiveUI.h(331, context),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                    children: List.generate(
                                        vm.recommendationData!.length, (index) {
                                  return Reusablerecommendationcard(
                                      icon: vm.recommendationData![index].icon,
                                      title:
                                          vm.recommendationData![index].title,
                                      subtitle: vm
                                          .recommendationData![index].subtitle);
                                })
                                    // [
                                    //   SizedBox(
                                    //     height: ResponsiveUI.h(26, context),
                                    //   ),
                                    //   Text(vm.recommendationData![1].title),
                                    //   SizedBox(
                                    //     height: ResponsiveUI.h(15, context),
                                    //   ),
                                    //   Reusablerecommendationcard(),
                                    //   SizedBox(
                                    //     height: ResponsiveUI.h(15, context),
                                    //   ),
                                    //   Reusablerecommendationcard(),
                                    //   SizedBox(
                                    //     height: ResponsiveUI.h(28, context),
                                    //   ),
                                    // ],
                                    ),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nearby Places',
                            style: TextStyle(
                                fontFamily: 'SFProRounded',
                                fontWeight: FontWeight.w700,
                                fontSize: ResponsiveUI.w(15, context),
                                color: Colors.black),
                          ),
                          Text(
                            'See all',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: ResponsiveUI.sp(13, context),
                                color: Color(0xff5140F2)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ResponsiveUI.h(15, context),
                      ),
                      Expanded(
                          child: ReusableMapView(
                        vm: vm,
                        mapboxMap: mapboxMap,
                      ))
                    ],
                  ),
                ),
    );
  }
}
