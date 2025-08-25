import 'package:flutter/material.dart';
import '../../../data/models/reviews_model.dart';
import '../../../data/repository/reviews/repository/reviews_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  final ReviewsRepository _repository;
  final int recipeId;

  ReviewsViewModel({
    required ReviewsRepository repository,
    required this.recipeId,
  }) : _repository = repository {
    loadReviews();
  }

  bool isLoading = false;
  String? errorMessage;
  ReviewsModel? review;

  Future<void> loadReviews() async {
    isLoading = true;
    errorMessage = null;
    review = null;
    notifyListeners();

    final result = await _repository.getRecipeReviews(recipeId);

    result.fold(
          (error) {
            print("error: $error");
        errorMessage = error.toString();
      },
          (data) {
            print("data: $data");
        review = data;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}

