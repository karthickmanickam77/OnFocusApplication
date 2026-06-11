import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';
import 'package:get_it/get_it.dart';

class SplashScreenModel {
  final ISharedPreferenceService sharedPreferenceService =
      GetIt.I<ISharedPreferenceService>();
}
