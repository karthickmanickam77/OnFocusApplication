abstract class ISharedPreferenceService {
  Future<void> setMoodSelected(bool value);

  Future<bool> getAppsStoredStatus();

  Future<bool> getMoodSelected();

  Future<void> setOnboardingVisited(bool value);

  Future<void> setAppsStoredStatus(bool value);

  Future<bool> getOnboardingVisited();

  Future<void> setUserStatus(String status);

  Future<String> getUserStatus();

  Future<void> clearUserSession();
}
