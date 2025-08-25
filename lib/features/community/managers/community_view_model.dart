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

  Future<void> getCommunity() async {
    isLoading = true;
    notifyListeners();
    try {
      recipes = await _repository.getCommunity();
      likedStates = List.filled(recipes.length, false);
    } catch (e) {
      debugPrint('Community fetch error: $e');
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