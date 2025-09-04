import 'package:flutter/material.dart';
import 'package:untitled3/data/models/recipe_model.dart';
import 'package:untitled3/data/models/category_model.dart';
import '../../../data/repository/categories/category_repository.dart';
import '../../../data/repository/recipes/recipe_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipesRepository _recipesRepository;
  final CategoryRepository _categoryRepository;
  final int catId;

  RecipeViewModel({
    required RecipesRepository recipesRepository,
    required CategoryRepository categoryRepository,
    required this.catId,
  })  : _recipesRepository = recipesRepository,
        _categoryRepository = categoryRepository {
    selectedCategoryId = catId;
    fetchCategories();
    fetchRecipes();
  }

  bool isLoading = false;
  String? errorMessage;
  List<RecipeModel> recipes = [];
  List<CategoryModel> categories = [];
  int selectedCategoryId = 0;
  final List<int> likedItems = [];


  Future<void> fetchRecipes() async {
    isLoading = true;
    errorMessage = null;
    recipes = [];
    notifyListeners();

    final result = await _recipesRepository.getRecipe();
    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (data) {
        if (selectedCategoryId != 0) {
          recipes = data.where((r) => r.categoryId == selectedCategoryId).toList();
        } else {
          recipes = data;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = null;
    categories = [];
    notifyListeners();

    final result = await _categoryRepository.getCategories();
    result.fold(
          (error) {
        errorMessage = error.toString();
      },
          (data) {
        categories = data;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void changeCategory(int categoryId) {
    selectedCategoryId = categoryId;
    fetchRecipes();
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
