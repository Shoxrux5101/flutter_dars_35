import 'package:flutter/material.dart';
import '../../../data/models/reviews_model.dart';
import '../../../data/repository/reviews/repository/reviews_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  final ReviewsRepository _repository;

  ReviewsViewModel({required ReviewsRepository repository})
      : _repository = repository;

  ReviewsModel? review;
  bool isLoading = false;
  String errorMessage = '';
  bool get hasError => errorMessage.isNotEmpty;

  Future<void> loadReviews(int id) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    final result = await _repository.getReviews(id);
    result.fold(
          (error) {
        errorMessage = error.toString();
        review = null;
      },
          (reviewData) {
        review = reviewData;
        errorMessage = '';
      },
    );
    isLoading = false;
    notifyListeners();
  }
  void clearError() {
    errorMessage = '';
    notifyListeners();
  }
  void clearData() {
    review = null;
    errorMessage = '';
    isLoading = false;
    notifyListeners();
  }
}
