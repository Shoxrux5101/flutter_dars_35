import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/data/models/home/cuisine_model.dart';
import '../../../core/client.dart';
import '../../../data/models/home/recipe_model.dart';

class HomePageViewModel extends ChangeNotifier {


  HomePageViewModel() {
    fetchCategories();
  }

  String? error;

  bool isCuisinesLoading = true;
  List<CuisineModel> categories = [];

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
