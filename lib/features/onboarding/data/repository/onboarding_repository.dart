import 'package:first_app/features/core/data/api/rest_client.dart';
import 'package:first_app/features/core/data/settings_storage/settings_storage.dart';
import 'package:first_app/features/core/domain/entity/result.dart';
import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';

abstract interface class IOnboardingRepository {
  RequestOperation<OnboardingEntity> getOnboarding();
}

final class OnboardingRepository implements IOnboardingRepository {
  final RestClient _client;
  //final SettingsRepository _settingsRepository;
  OnboardingRepository({/*required SettingsRepository settingsRepository,*/ required RestClient client}) : _client = client/*, _settingsRepository = settingsRepository*/;

  @override
  RequestOperation<OnboardingEntity> getOnboarding() async {
    try {
      final data = await _client.getOnboarding();

      final pageEntities = data.pages
          .map((page) => OnboardingPageEntity(
                title: page.title,
                description: page.description,
                image: page.image,
              ))
          .toList();

      final result = OnboardingEntity(pages: pageEntities);
      return Result.ok(result);
    } on Exception catch (error, trace) {
      return Result.failed(
        Failure(
          original: error,
          trace: trace,
        ),
      );
    }
  }
}
