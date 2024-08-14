// todo: там уже дописать всю логику для превращение null и not null into true false

import 'package:shared_preferences/shared_preferences.dart';

const String keyOnboardingCompleted = 'onboarding_completed';

abstract class ISettingsRepository {
  bool isOnboardingCompleted();

  Future<void> setOnboardingCompleted();
}

class SettingsRepository implements ISettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  @override
  bool isOnboardingCompleted() {
    return _prefs.getBool(keyOnboardingCompleted) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    await _prefs.setBool(keyOnboardingCompleted, true);
  }
}
