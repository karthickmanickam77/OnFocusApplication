import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class WeatherBO {
  double? temperature_2m;
  int? weather_code;
  int? is_day;

  WeatherBO({
    this.temperature_2m,
    this.weather_code,
    this.is_day,
  });
  String get recommendationText {
    switch (weather_code) {
      case 0:
        return "Perfect weather for a relaxing walk outdoors";

      case 1:
        return "Great time to visit a nearby park and refresh your mind";

      case 2:
        return "A calm walk or breathing exercise could help you focus";

      case 3:
        return "Cloudy weather is perfect for journaling or quiet reading";

      case 45:
      case 48:
        return "Foggy weather is ideal for staying cozy indoors with music or tea";

      case 51:
      case 53:
      case 55:
        return "Light rain outside — a peaceful indoor activity may help you relax";

      case 61:
      case 63:
      case 65:
        return "Rainy weather is perfect for reading or meditation indoors";

      case 71:
      case 73:
      case 75:
        return "Cold snowy weather calls for warmth, rest, and calming activities";

      case 80:
      case 81:
      case 82:
        return "Showers may interrupt outdoor plans, try a mindful indoor break";

      case 95:
        return "Stormy weather outside — stay safe and take time to unwind indoors";

      default:
        return "Take a small mindful break and refresh yourself";
    }
  }

  String get weatherText {
    switch (weather_code) {
      case 0:
        return "Clear Sky";

      case 1:
        return "Mostly Clear";

      case 2:
        return "Partly Cloudy";

      case 3:
        return "Overcast";

      case 61:
        return "Rainy";

      case 71:
        return "Snow";

      case 95:
        return "Thunderstorm";

      default:
        return "Unknown";
    }
  }
}
