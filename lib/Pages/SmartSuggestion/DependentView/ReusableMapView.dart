import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class ReusableMapView extends StatelessWidget {
  var vm;
  MapboxMap? mapboxMap;
  ReusableMapView({super.key, required this.vm, required this.mapboxMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: MapWidget(
          onTapListener: (context) {
            vm.updateMapExpand();
          },
          key: const ValueKey("mapWidget"),
          styleUri: MapboxStyles.MAPBOX_STREETS,
          cameraOptions: CameraOptions(
            center: Point(
              coordinates: Position(
                vm.devicecurrentPositionData!.longitude,
                vm.devicecurrentPositionData!.latitude,
              ),
            ),
            zoom: 12,
          ),
          onMapCreated: (MapboxMap map) async {
            mapboxMap = map;

            await map.flyTo(
              CameraOptions(
                center: Point(
                  coordinates: Position(
                    vm.devicecurrentPositionData!.longitude,
                    vm.devicecurrentPositionData!.latitude,
                  ),
                ),
                zoom: 15,
              ),
              MapAnimationOptions(duration: 1500),
            );
            await mapboxMap?.location.updateSettings(
              LocationComponentSettings(
                enabled: true,
                pulsingEnabled: true,
              ),
            );
            await vm.drawRoute(mapboxMap);
          },
        ),
      ),
    );
  }
}
