import 'package:first_app/api/rest_client.dart';
import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';

abstract interface class IOnboardingRepository {
  Future<OnboardingEntity> getOnboarding();
}

final class OnboardingRepoditory implements IOnboardingRepository {
  final RestClient _client;

  OnboardingRepoditory({required RestClient client}) : _client = client;

  @override
  Future<OnboardingEntity> getOnboarding() async {
    final data = await _client.getOnboarding();

    final pageEnities = data.pages
        .map((page) => OnboardingPageEntity(
              title: page.title,
              description: page.description,
              image: page.image,
            ))
        .toList();

    final result = OnboardingEntity(pages: pageEnities);

    return result;
  }
}
