import 'package:flutter/foundation.dart';
import '../../../data/models/following_model.dart';
import '../../../data/repository/following/following_repository.dart';

class FollowingViewModel extends ChangeNotifier {
  final FollowingRepository repository;

  FollowingViewModel({required this.repository});

  List<FollowingModel> following = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadFollowing() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    final result = await repository.fetchFollowing();
    result.fold(
          (error) {
        errorMessage = error.toString();
        following = [];
      },
          (data) {
        following = data;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void removeUser(int id) {
    following.removeWhere((u) => u.id == id);
    notifyListeners();
  }
}
