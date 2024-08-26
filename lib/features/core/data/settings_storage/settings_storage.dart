import 'package:first_app/features/core/domain/entity/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyOnboardingCompleted = 'onboarding_completed';

abstract class ISettingsRepository {
  RequestOperation<bool> isOnboardingCompleted();
  RequestOperation<void> setOnboardingCompleted();
}

class SettingsRepository implements ISettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  @override
  RequestOperation<bool> isOnboardingCompleted() async {
    try {
      final result = _prefs.getBool(keyOnboardingCompleted) ?? false;
      return Result.ok(result);
    } catch (error, stackTrace) {
      return Result.failed(Failure(original: error, trace: stackTrace));
    }
  }

  @override
  RequestOperation<void> setOnboardingCompleted() async {
    try {
      final result = await _prefs.setBool(keyOnboardingCompleted, true);
      if (result) {
        return const Result.ok(null);
      } else {
        return Result.failed(Failure(original: Exception('Failed to save data'), trace: StackTrace.current));
      }
    } catch (error, stackTrace) {
      return Result.failed(Failure(original: error, trace: stackTrace));
    }
  }
}
