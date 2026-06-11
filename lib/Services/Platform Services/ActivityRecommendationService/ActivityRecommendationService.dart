import 'package:cookbook/BOs/ActivityTypeBO/ActivityTypeBO.dart';
import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';
import 'package:cookbook/Helpers/Utilities/Enums/ActivityType.dart';
import 'package:cookbook/Services/Platform%20Services/ActivityRecommendationService/IActivityRecommendationService.dart';

class RecommendationService extends IRecommendationService {
  @override
  List<ActivityRecommendationBO> generateRecommendations({
    required WeatherBO weatherBO,

    // required List<NearbyPlaceBO>
    //     nearbyPlaces,

    required DateTime currentTime,
  }) {
    List<ActivityRecommendationBO> recommendations = [];

    /// SUNNY WEATHER
    if (weatherBO.weather_code == 0 || weatherBO.weather_code == 1) {
      recommendations.add(
        ActivityRecommendationBO(
          title: 'Take a walk nearby',
          subtitle: '20 min can refresh your mind',
          icon: 'walking',
          activityType: RecommendationActivityType.walking,
        ),
      );

      recommendations.add(
        ActivityRecommendationBO(
          title: 'Outdoor breathing exercise',
          subtitle: 'Fresh air improves focus',
          icon: 'breathing',
          activityType: RecommendationActivityType.breathing,
        ),
      );
    }

    /// RAINY WEATHER
    if (weatherBO.weatherText == "Rainy") {
      recommendations.add(
        ActivityRecommendationBO(
          title: 'Read for 10 minutes',
          subtitle: 'Rainy weather is perfect for reading',
          icon: 'book',
          activityType: RecommendationActivityType.reading,
        ),
      );

      recommendations.add(
        ActivityRecommendationBO(
          title: 'Relax with calming music',
          subtitle: 'Reduce stress and anxiety',
          icon: 'music',
          activityType: RecommendationActivityType.music,
        ),
      );
    }

    /// NIGHT TIME
    if (currentTime.hour >= 21) {
      recommendations.add(
        ActivityRecommendationBO(
          title: 'Try journaling',
          subtitle: 'Clear your thoughts before sleep',
          icon: 'journal',
          activityType: RecommendationActivityType.journaling,
        ),
      );
    }

    // /// PARK AVAILABLE
    // bool hasPark = nearbyPlaces.any(
    //   (e) =>
    //       e.placeType == 'park',
    // );

    // if (hasPark) {

    //   recommendations.add(
    //     ActivityRecommendationBO(
    //       title: 'Visit a nearby park',
    //       subtitle:
    //           'Nature can calm the mind',
    //       icon: 'park',
    //       activityType:
    //           ActivityType.walking,
    //     ),
    //   );
    // }

    /// FALLBACK
    if (recommendations.isEmpty) {
      recommendations.add(
        ActivityRecommendationBO(
          title: 'Take a short mindful break',
          subtitle: 'Small breaks improve productivity',
          icon: 'relax',
          activityType: RecommendationActivityType.meditation,
        ),
      );
    }

    return recommendations;
  }
}
