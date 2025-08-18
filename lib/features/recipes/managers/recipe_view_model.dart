import 'package:flutter/material.dart';
import 'package:untitled3/data/models/recipe_model.dart';
import 'package:untitled3/data/models/category_model.dart';
import '../../../data/repository/categories/repository/category_repository.dart';
import '../../../data/repository/recipes/repository/recipe_repository.dart';

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
    _selectedCategoryId = catId;
    fetchCategories();
    fetchRecipes();
  }

  bool _isLoading = false;
  String? _errorMessage;
  List<RecipeModel> _recipes = [];
  List<CategoryModel> _categories = [];
  int _selectedCategoryId = 0;
  final List<int> likedItems = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<RecipeModel> get recipes => _recipes;
  List<CategoryModel> get categories => _categories;
  int get selectedCategoryId => _selectedCategoryId;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    _errorMessage = null;
    _recipes = [];
    notifyListeners();

    final result = await _recipesRepository.getRecipe();
    result.fold(
          (error) {
        _errorMessage = error.toString();
      },
          (data) {
        if (_selectedCategoryId != 0) {
          _recipes = data.where((r) => r.categoryId == _selectedCategoryId).toList();
        } else {
          _recipes = data;
        }
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    _categories = [];
    notifyListeners();

    final result = await _categoryRepository.getCategories();
    result.fold(
          (error) {
        _errorMessage = error.toString();
      },
          (data) {
        _categories = data;
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  void changeCategory(int categoryId) {
    _selectedCategoryId = categoryId;
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
