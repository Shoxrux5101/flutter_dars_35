import 'package:flutter/material.dart';
import '../../../core/client.dart';
import '../../../data/models/home/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel() {
    fetchOnboarding();
  }
  String? error;
  bool isOnboardingLoading = true;

  List<OnboardingModel> onboarding = [];

  Future<void> fetchOnboarding() async {
    isOnboardingLoading = true;
    notifyListeners();

    try {
      final response = await dio.get('/onboarding/list');

      if (response.statusCode != 200) {
        error = response.data.toString();
        isOnboardingLoading = false;
        notifyListeners();
        return;
      }
      onboarding = (response.data as List)
          .map((json) => OnboardingModel.fromJson(json))
          .toList();
    } catch (e) {
      error = e.toString();
    }

    isOnboardingLoading = false;
    notifyListeners();
  }
}