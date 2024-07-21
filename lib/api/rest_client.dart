import 'package:dio/dio.dart';
import 'package:first_app/features/onboarding/data/dto/onboarding_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://up-note.globeapp.dev/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/onboarding')
  Future<OnboardingResponseDto> getOnboarding();
}
