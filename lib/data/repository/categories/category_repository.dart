import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';
import '../../models/category_model.dart';

class CategoryRepository {
  final ApiClient _apiClient;

  CategoryRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CategoryModel>>> getAll() async {
    final response = await _apiClient.get<List>('/categories/list');

    return response.fold(
          (error) => Result.error(error),
          (value) {
        final categories = value.map((e) => CategoryModel.fromJson(e)).toList();
        return Result.ok(categories);
      },
    );
  }
}
