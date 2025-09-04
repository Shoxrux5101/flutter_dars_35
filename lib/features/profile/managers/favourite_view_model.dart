import 'package:flutter/material.dart';
import 'package:untitled3/data/repository/recipes/recipe_repository.dart';
import '../../../data/models/recipe_model.dart';

class FavouriteViewModel extends ChangeNotifier {
  final RecipesRepository repository;

  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? error;

  FavouriteViewModel({required this.repository}) {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await repository.getRecipe();

      result.fold(
            (err) {
          recipes = [];
          error = err.toString();
        },
            (data) {
          recipes = data;
        },
      );
    } catch (e) {
      error = "Network xatosi: $e";
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
