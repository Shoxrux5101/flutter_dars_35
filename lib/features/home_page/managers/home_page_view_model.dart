// import 'package:flutter/widgets.dart';
// import 'package:untitled3/data/models/category_model.dart';
// import 'package:untitled3/data/models/chefs_model.dart';
// import 'package:untitled3/data/models/recipe_model.dart';
// import 'package:untitled3/data/models/trending_recipes_model.dart';
// import 'package:untitled3/data/repository/categories/category_repository.dart';
// import 'package:untitled3/data/repository/chefs/chefs_repository.dart';
// import 'package:untitled3/data/repository/recipes/recipe_repository.dart';
// import 'package:untitled3/data/repository/trending_recipes/trending_recipes_repository.dart';
//
// class HomePageViewModel extends ChangeNotifier {
//   final ChefsRepository _chefsRepository;
//   final CategoryRepository _categoryRepository;
//   final RecipesRepository _recipesRepository;
//   final TrendingRecipesRepository _trendingRecipesRepository;
//
//   HomePageViewModel({
//     required ChefsRepository chefsRepository,
//     required CategoryRepository categoryRepository,
//     required RecipesRepository recipesRepository,
//     required TrendingRecipesRepository trendingRecipesRepository,
//   }) : _chefsRepository = chefsRepository,
//        _categoryRepository = categoryRepository,
//        _recipesRepository = recipesRepository,
//        _trendingRecipesRepository = trendingRecipesRepository;
//
//   List<ChefsModel> chef = [];
//   List<CategoryModel> category = [];
//   List<RecipeModel> recipe = [];
//   TrendingRecipesModel? trending;
//
//   bool isLoadingChefs = false;
//   bool isLoadingCategory = false;
//   bool isLoadingRecipe = false;
//   bool isLoadingTrending = false;
//
//   String? errorChefs;
//
//   String? errorCategory;
//
//   String? errorRecipe;
//
//   String? errorTrending;
//
//   Future<void> fetchChef() async {
//     isLoadingChefs = true;
//     notifyListeners();
//     var result = await _chefsRepository.getChefs(ids);
//     result.fold(
//       (error){
//         return errorChefs = error.toString();
//       },
//         (value) {
//         return chef = value;
//         }
//     );
//     isLoadingChefs = false;
//     notifyListeners();
//   }
//
//   Future<void> fetchCategory() async {
//     isLoadingCategory = true;
//     notifyListeners();
//     var result = await _categoryRepository.getAll();
//     result.fold(
//           (error) {
//         errorCategory = error.toString();
//       },
//           (value) {
//         category = value;
//       },
//     );
//     isLoadingCategory = false;
//     notifyListeners();
//   }
//
//   Future<void> fetchRecipe() async {
//     isLoadingRecipe = true;
//     notifyListeners();
//     var result = await _recipesRepository.getRecipe();
//     result.fold(
//           (error) {
//         errorRecipe = error.toString();
//       },
//           (value) {
//         recipe = value;
//       },
//     );
//     isLoadingRecipe = false;
//     notifyListeners();
//   }
//
//   Future<void> fetchTrending() async {
//     isLoadingTrending = true;
//     notifyListeners();
//     var result = await _trendingRecipesRepository.getTrendingRecipe();
//     result.fold(
//           (error) {
//         errorTrending = error.toString();
//       },
//           (value) {
//         trending = value;
//       },
//     );
//     isLoadingTrending = false;
//     notifyListeners();
//   }
// }
