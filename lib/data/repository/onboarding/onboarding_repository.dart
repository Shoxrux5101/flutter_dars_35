import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import '../../models/onboarding_model.dart';

class OnboardingRepository {
  final ApiClient _apiClient;

  OnboardingRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<OnboardingModel>>> getOnboarding() async {
    try {
      final result = await _apiClient.get('/onboarding/list');
      return result.fold(
            (error) => Result.error(error),
            (data) {
          final onboarding = (data as List)
              .map((json) => OnboardingModel.fromJson(json))
              .toList();
          return Result.ok(onboarding);
        },
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
