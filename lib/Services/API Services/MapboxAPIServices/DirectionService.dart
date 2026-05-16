import 'package:cookbook/Services/API%20Services/MapboxAPIServices/IDirectionService.dart';
import 'package:dio/dio.dart';

class DirectionService extends IDirectionService {
  final Dio dio = Dio();

  @override
  Future<List<dynamic>> getRoute({
    required double startLat,
    required double startLon,
    required double endLat,
    required double endLon,
    required String accessToken,
  }) async {
    final url = "https://api.mapbox.com/directions/v5/mapbox/walking/"
        "${startLon.toString()},${startLat.toString()};"
        "${endLon.toString()},${endLat.toString()}"
        "?alternatives=false"
        "&geometries=geojson"
        "&overview=full"
        "&steps=true"
        "&access_token=$accessToken";
        
    final response = await dio.get(url);

    return response.data['routes'][0]['geometry']['coordinates'];
  }
}
