import 'package:meta/meta.dart';

@immutable
class OnboardingEntity {
  final List<OnboardingPageEntity> pages;

  int get pagesCount => pages.length;

  OnboardingPageEntity getPage(int index) {
    return pages[index];
  }

  const OnboardingEntity({
    required this.pages,
  });
}

@immutable
class OnboardingPageEntity {
  final String title;
  final String description;
  final String image;

  const OnboardingPageEntity({
    required this.title,
    required this.description,
    required this.image,
  });
}
