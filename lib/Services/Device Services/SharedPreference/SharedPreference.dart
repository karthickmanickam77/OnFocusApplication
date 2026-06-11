import 'package:cookbook/Services/Device%20Services/SharedPreference/ISharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService implements ISharedPreferenceService {
  static const _moodSelected = "moodSelected";

  static const _onboardingVisited = "onboardingVisited";

  static const _userLogin = "isUserLogin";

  static const _appsStored = "isAppsStored";

  Future<SharedPreferences> get _pref async => SharedPreferences.getInstance();

  @override
  Future<void> setMoodSelected(
    bool value,
  ) async {
    final pref = await _pref;

    await pref.setBool(
      _moodSelected,
      value,
    );
  }

  @override
  Future<void> setAppsStoredStatus(
    bool value,
  ) async {
    final pref = await _pref;

    await pref.setBool(
      _appsStored,
      value,
    );
  }

  @override
  Future<bool> getAppsStoredStatus() async {
    final pref = await _pref;

    return pref.getBool(
          _appsStored,
        ) ??
        false;
  }

  @override
  Future<bool> getMoodSelected() async {
    final pref = await _pref;

    return pref.getBool(
          _moodSelected,
        ) ??
        false;
  }

  @override
  Future<void> setOnboardingVisited(
    bool value,
  ) async {
    final pref = await _pref;

    await pref.setBool(
      _onboardingVisited,
      value,
    );
  }

  @override
  Future<bool> getOnboardingVisited() async {
    final pref = await _pref;

    return pref.getBool(
          _onboardingVisited,
        ) ??
        false;
  }

  @override
  Future<void> setUserStatus(
    String token,
  ) async {
    final pref = await _pref;

    await pref.setString(
      _userLogin,
      token,
    );
  }

  @override
  Future<String> getUserStatus() async {
    final pref = await _pref;

    return pref.getString(
          _userLogin,
        ) ??
        "";
  }

  @override
  Future<void> clearUserSession() async {
    final pref = await _pref;

    await pref.remove(_userLogin);
  }
}
