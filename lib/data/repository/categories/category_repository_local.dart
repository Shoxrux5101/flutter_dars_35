// import 'package:hive/hive.dart';
// import 'package:untitled3/data/models/category_model.dart';
//
// class CategoryRepositoryLocal {
//   final _box = Hive.box<CategoryModel>('categories');
//   Future<List<CategoryModel>> getAll() async {
//     return _box.values.toList();
//   }
//
//   Future<void> save(List<CategoryModel> categories) async{
//     await _box.clear();
//     await _box.addAll(categories);
//   }
// }