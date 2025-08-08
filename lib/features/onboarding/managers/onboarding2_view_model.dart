import 'package:flutter/material.dart';
import '../../../core/client.dart';
import '../../../data/models/home/onboarding2_model.dart';

class Onboarding2ViewModel extends ChangeNotifier {
  Onboarding2ViewModel() {
    fetchOnboarding();
  }

  String? error;
  bool isOnboardingLoading = true;

  List<Onboarding2Model> onboarding = [];

  Future<void> fetchOnboarding() async {
    isOnboardingLoading = true;
    notifyListeners();

    try {
      final response = await dio.get('/allergic/list');

      if (response.statusCode != 200) {
        error = response.data.toString();
        isOnboardingLoading = false;
        notifyListeners();
        return;
      }

      onboarding = (response.data as List)
          .map((json) => Onboarding2Model.fromJson(json))
          .toList();

    } catch (e) {
      error = e.toString();
    }

    isOnboardingLoading = false;
    notifyListeners();
  }
}
