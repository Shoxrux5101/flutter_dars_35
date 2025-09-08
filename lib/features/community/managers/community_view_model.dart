import 'package:flutter/cupertino.dart';
import '../../../data/models/community_model.dart';
import '../../../data/repository/community/community_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  final CommunityRepository _repository;

  CommunityViewModel(this._repository) {
    getCommunity();
  }

  bool isLoading = false;
  List<bool> likedStates = [];
  List<CommunityModel> recipes = [];
  String? errorMessage;

  Future<void> getCommunity() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await _repository.getCommunity();

      result.fold(
            (error) {
          errorMessage = error.toString();
          debugPrint('Community fetch error: $error');
        },
            (communityList) {
          recipes = communityList;
          likedStates = List.filled(recipes.length, false);
        },
      );
    } catch (e) {
      errorMessage = 'Unexpected error: $e';
      debugPrint('Unexpected error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleLike(int index) {
    if (index < 0 || index >= likedStates.length) return;
    likedStates[index] = !likedStates[index];
    notifyListeners();
  }
}