import 'package:flutter/material.dart';
import 'package:untitled3/data/models/chefs_model.dart';
import 'package:untitled3/data/repository/chefs/repository/chefs_repository.dart';

class TopChefsViewModel extends ChangeNotifier {
  final ChefsRepository _repository;
  final int id;

  TopChefsViewModel({required ChefsRepository repository, required this.id})
      : _repository = repository;

  bool isLoading = false;
  String? errorMessage;

  List<ChefsModel> topChefs = [];
  List<ChefsModel> mostLikeChefs = [];
  List<ChefsModel> newChefs = [];

  Future<void> fetchTopChefs() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getChef(id);

    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (chef) {
        topChefs = [chef];
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
