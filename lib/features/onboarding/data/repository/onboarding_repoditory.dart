import 'package:first_app/api/rest_client.dart';
import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';

abstract interface class IOnboardingRepository {
  Future<OnboardingEntity> getOnboarding();
}

final class OnboardingRepository implements IOnboardingRepository {
  final RestClient _client;

  OnboardingRepository({required RestClient client}) : _client = client;

  @override
  Future<OnboardingEntity> getOnboarding() async {
    final data = await _client.getOnboarding();

    final pageEntities = data.pages
        .map((page) => OnboardingPageEntity(
              title: page.title,
              description: page.description,
              image: page.image,
            ))
        .toList();

    final result = OnboardingEntity(pages: pageEntities);

    return result;
  }
}
