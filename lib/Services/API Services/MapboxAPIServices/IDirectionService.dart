abstract class IDirectionService {
  Future<List<dynamic>> getRoute({
    required double startLat,
    required double startLon,
    required double endLat,
    required double endLon,
    required String accessToken,
  });
}
