// import 'package:untitled3/data/models/category_model.dart';
// import '../../../core/network/api_client.dart';
// import '../../../core/utils/result.dart';
//
// class CategoryRepositoryRemote {
//   CategoryRepositoryRemote({
//     required ApiClient apiClient,
// }) : _apiClient = apiClient;
//   final ApiClient _apiClient;
//   Future<Result<List<CategoryModel>>> getAll () async {
//     var response = await _apiClient.get<List>('/admin/categories/list');
//
//     return response.fold (
//       (error) => Result.error(error),
//         (value) async {
//         return Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList());
//     }
//     );
//   }
//
// }