import 'package:cookbook/Helpers/Utilities/Enums/ActivityType.dart';

class ActivityRecommendationBO {
  final String title;
  final String subtitle;
  final String icon;
  final RecommendationActivityType activityType;

  ActivityRecommendationBO({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.activityType,
  });
}
