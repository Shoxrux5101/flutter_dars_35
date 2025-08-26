import 'package:flutter/cupertino.dart';

import '../../../data/repository/reviews/repository/reviews_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  final ReviewsRepository _repository;
  final int id;

  ReviewsViewModel({
    required ReviewsRepository repository,
    required this.id,
  }) : _repository = repository {
    getRecipeDetail();
  }

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? recipeData;

  Future<void> getRecipeDetail() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _repository.getRecipeDetail(id);

      recipeData = result;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
