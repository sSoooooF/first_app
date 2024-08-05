// todo: тут интерфейс и его реализация с sharedPref. Ключи вынести в константы (глобальные)
// todo: два метода на чтение и запись переменных по onboarding
// todo: прокинуть в repository
// todo: там уже дописать всю логику для превращение null и not null into true false

import 'package:shared_preferences/shared_preferences.dart';

abstract class ISettingsRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted(bool completed);
}

class SettingsRepository implements ISettingsRepository {
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  @override
  Future<bool> isOnboardingCompleted() async {
    return _prefs.getBool(_keyOnboardingCompleted)?? false;
  }

  @override
  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(_keyOnboardingCompleted, completed);
  }
}