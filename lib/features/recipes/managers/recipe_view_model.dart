import 'package:flutter/material.dart';
import '../../../core/client.dart';
import '../../../data/models/home/category_model.dart';
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
  List<CategoryModel> categories = [];

  void changeCategory(int newCatId) {
    catId = newCatId;
    fetchRecipe();
    notifyListeners();
  }
  Future<void> fetchRecipe() async {
    isRecipesLoading = true;
    notifyListeners();
    final response = await dio.get('/recipes/list');
    if (response.statusCode != 200) {
      error = response.data;
      isRecipesLoading = false;
      notifyListeners();
      return;
    }
    recipes = (response.data as List)
        .map((json) => RecipeModel.fromJson(json))
        .where((r) => r.categoryId == catId)
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
        .map((json) => CategoryModel.fromJson(json))
        .toList();
    isCuisinesLoading = false;
    notifyListeners();
  }
}
