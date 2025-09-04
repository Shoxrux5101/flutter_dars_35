import 'package:flutter/material.dart';
import 'package:untitled3/data/models/recipe_model.dart';
import '../../../data/repository/chefs/top_chefs_profile_repository.dart';

class TopChefsProfileViewModel extends ChangeNotifier {
  final TopChefsProfileRepository _repository;

  TopChefsProfileViewModel({required TopChefsProfileRepository repository})
      : _repository = repository;

  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchChefsRecipes(int chefId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getChefsRecipes(chefId);
    result.fold(
          (error) {
        errorMessage = error.toString();
        recipes = [];
      },
          (data) {
        recipes = data;
        errorMessage = null;
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
