import 'package:cookbook/BOs/MoodBO/MoodBO.dart';
import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';
import 'package:get_it/get_it.dart';

class MoodScreenModel {
  final ISharedPreferenceService sharedPreferenceService =
      GetIt.I<ISharedPreferenceService>();
  List<MoodBO> moodList = [];

  setMoodList(List<MoodBO> value) {
    moodList = value;
  }
}
