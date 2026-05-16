import 'package:cookbook/BOs/ActivityTypeBO/ActivityTypeBO.dart';
import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';

abstract class IRecommendationService {

  List<ActivityRecommendationBO>
      generateRecommendations({

    required WeatherBO weatherBO,

    // required List<NearbyPlaceBO>
    //     nearbyPlaces,

    required DateTime currentTime,
  });
}