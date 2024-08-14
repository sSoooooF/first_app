import 'package:json_annotation/json_annotation.dart';

part 'onboarding_dto.g.dart';

@JsonSerializable()
class OnboardingResponseDto {
  final List<OnboardingPageDto> pages;

  OnboardingResponseDto({
    required this.pages,
  });

  factory OnboardingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OnboardingResponseDtoFromJson(json);
}

@JsonSerializable()
class OnboardingPageDto {
  final String title;
  final String description;
  final String image;

  OnboardingPageDto({
    required this.title,
    required this.description,
    required this.image,
  });

  factory OnboardingPageDto.fromJson(Map<String, dynamic> json) =>
      _$OnboardingPageDtoFromJson(json);
}
