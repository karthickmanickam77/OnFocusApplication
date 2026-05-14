import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/SmartSuggestion/LocalReusables/ReusableRecommendationCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SmartSugesstionScreen extends StatelessWidget {
  const SmartSugesstionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveUI.w(20, context)),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: ResponsiveUI.h(10, context),
                  bottom: ResponsiveUI.h(24, context)),
              // width: ResponsiveUI.w(353, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ResponsiveUI.r(8, context)),
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
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: '23°C\n',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveUI.sp(15, context),
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sunny\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Perfect weather for a walk!'),
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
            Reusablerecommendationcard(),
            SizedBox(
              height: ResponsiveUI.h(15, context),
            ),
            Reusablerecommendationcard(),
            SizedBox(
              height: ResponsiveUI.h(15, context),
            ),
            Reusablerecommendationcard(),
            SizedBox(
              height: ResponsiveUI.h(28, context),
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
            SizedBox(
              height: 170,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MapWidget(
                  key: const ValueKey("mapWidget"),
                  styleUri: MapboxStyles.MAPBOX_STREETS,
                  cameraOptions: CameraOptions(
                    center: Point(
                      coordinates: Position(6.6440, 49.7596),
                    ),
                    zoom: 12,
                  ),
                  onMapCreated: (MapboxMap map) async {
                    mapboxMap = map;

                    await map.flyTo(
                      CameraOptions(
                        center: Point(
                          coordinates: Position(80.2707, 13.0827),
                        ),
                        zoom: 15,
                      ),
                      MapAnimationOptions(duration: 1500),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
