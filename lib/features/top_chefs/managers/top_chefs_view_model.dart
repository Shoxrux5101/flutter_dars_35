import 'package:flutter/material.dart';
import 'package:untitled3/data/models/chefs_model.dart';
import 'package:untitled3/data/repository/chefs/chefs_repository.dart';

class TopChefsViewModel extends ChangeNotifier {
  final ChefsRepository _repository;

  TopChefsViewModel({required ChefsRepository repository})
      : _repository = repository;

  bool isLoading = false;
  String? errorMessage;

  List<ChefsModel> topChefs = [];
  List<ChefsModel> mostLikeChefs = [];
  List<ChefsModel> newChefs = [];

  Future<void> fetchTopViewedChefs(List<int> ids) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getChefs(ids);

    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (chefs) {
        topChefs = chefs;
      },
    );

    isLoading = false;
    notifyListeners();
  }
  Future<void> fetchTopLikedChefs(List<int> ids) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getChefs(ids);

    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (chefs) {
            mostLikeChefs = chefs;
      },
    );

    isLoading = false;
    notifyListeners();
  }
  Future<void> fetchNewChefs(List<int> ids) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getChefs(ids);

    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (chefs) {
        newChefs = chefs;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}

