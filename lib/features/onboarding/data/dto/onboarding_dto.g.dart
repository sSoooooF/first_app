// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingResponseDto _$OnboardingResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OnboardingResponseDto(
      pages: (json['pages'] as List<dynamic>)
          .map((e) => OnboardingPageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OnboardingResponseDtoToJson(
        OnboardingResponseDto instance) =>
    <String, dynamic>{
      'pages': instance.pages,
    };

OnboardingPageDto _$OnboardingPageDtoFromJson(Map<String, dynamic> json) =>
    OnboardingPageDto(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$OnboardingPageDtoToJson(OnboardingPageDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
