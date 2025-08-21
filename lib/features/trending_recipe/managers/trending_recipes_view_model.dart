import 'package:flutter/material.dart';
import 'package:untitled3/data/models/trending_recipes_model.dart';
import '../../../data/repository/trending_recipes/repository/trending_recipes_repository.dart';

class TrendingRecipesViewModel extends ChangeNotifier {
  final TrendingRecipesRepository _repository;

  TrendingRecipesViewModel({required TrendingRecipesRepository repository})
      : _repository = repository;

  bool isLoading = false;
  String? errorMessage;
  TrendingRecipesModel? recipes;

  final Set<int> likedItems = {};

  Future<void> fetchTrendingRecipes() async {
    isLoading = true;
    errorMessage = null;
    recipes = null;
    notifyListeners();

    final result = await _repository.getTrendingRecipe();
    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (data) {
        recipes = data;
      },
    );
    isLoading = false;
    notifyListeners();
  }
  void toggleLike(int id) {
    if (likedItems.contains(id)) {
      likedItems.remove(id);
    } else {
      likedItems.add(id);
    }
    notifyListeners();
  }
}
