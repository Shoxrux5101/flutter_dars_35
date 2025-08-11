import 'package:flutter/material.dart';
import '../../../core/client.dart';
import '../../../data/models/home/category_details_model.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  CategoryDetailsViewModel({required this.recipeId}) {
    fetchCategoryDetails(recipeId);
  }
  final int recipeId;
  String? error;
  bool isCategoryDetailsLoading = true;

  CategoryDetailsModel? _categoryDetails;
  CategoryDetailsModel? get categoryDetails => _categoryDetails;

  Future<void> fetchCategoryDetails(int catId) async {
    _setLoading(true);
    error = null;

    try {
      final response = await dio.get('/recipes/detail/$catId');

      if (response.statusCode != 200) {
        error = 'Error: ${response.statusCode}';
      } else {
        _categoryDetails = CategoryDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      error = e.toString();
    }
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isCategoryDetailsLoading = loading;
    notifyListeners();
  }
}
