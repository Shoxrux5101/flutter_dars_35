import 'package:flutter/material.dart';
import 'package:untitled3/data/models/home/category_model.dart';
import '../../../core/client.dart';

class CategoryPageViewModel extends ChangeNotifier {
  CategoryPageViewModel() {
    fetchCategories();
  }
  String? error;
  bool isCuisinesLoading = true;
  List<CategoryModel> categories = [];

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
