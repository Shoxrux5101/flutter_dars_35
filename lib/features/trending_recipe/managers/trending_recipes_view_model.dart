import 'package:flutter/material.dart';
import 'package:untitled3/data/models/trending_recipes_model.dart';
import '../../../data/repository/trending_recipes/repository/trending_recipes_repository.dart';

class TrendingRecipesViewModel extends ChangeNotifier {
  final TrendingRecipesRepository _repository;

  TrendingRecipesViewModel({required TrendingRecipesRepository repository})
      : _repository = repository;

  bool _isLoading = false;
  String? _errorMessage;
  TrendingRecipesModel? _recipes;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  TrendingRecipesModel? get recipes => _recipes;

  final Set<int> likedItems = {};

  Future<void> fetchTrendingRecipes() async {
    _isLoading = true;
    _errorMessage = null;
    _recipes = null;
    notifyListeners();

    final result = await _repository.getTrendingRecipe();
    result.fold(
          (error) {
        _errorMessage = error.toString();
      },
          (data) {
        _recipes = data;
      },
    );
    _isLoading = false;
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
