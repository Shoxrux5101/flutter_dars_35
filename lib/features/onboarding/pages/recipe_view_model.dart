import 'package:flutter/material.dart';
import '../../../core/client.dart';
import '../../../data/models/home/cuisine_model.dart';
import '../../../data/models/home/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {

  RecipeViewModel({required this.catId}) {
    fetchRecipe();
    fetchCategories();
  }

  int catId;
  String? error;
  bool isRecipesLoading = true;
  List<RecipeModel> recipes = [];
  bool isCuisinesLoading = true;
  List<CuisineModel> categories = [];

  Future<void> fetchRecipe() async {
    isRecipesLoading = true;
    notifyListeners();

    var response = await dio.get('/recipes/list');

    if (response.statusCode != 200) {
      error = response.data;
      isRecipesLoading = false;
      notifyListeners();
      return;
    }

    recipes = (response.data as List)
        .map((json) => RecipeModel.fromJson(json))
        .toList();

    isRecipesLoading = false;
    notifyListeners();
  }
  Future<void> fetchCategories() async {
    isCuisinesLoading = true;
    notifyListeners();
    var response = await dio.get('/categories/list');

    if (response.statusCode != 200) {
      error = response.data;
      isCuisinesLoading = false;
      notifyListeners();
    }
    categories = (response.data as List)
        .map((json) => CuisineModel.fromJson(json))
        .toList();
    isCuisinesLoading = false;
    notifyListeners();
  }
}

