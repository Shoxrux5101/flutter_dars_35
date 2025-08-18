import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../../../models/category_model.dart';

class CategoryRepository {
  final ApiClient _dioClient;

  CategoryRepository({required ApiClient dioClient})
      : _dioClient = dioClient;

  Future<Result<List<CategoryModel>>> getCategories() async {
    try {
      final result = await _dioClient.get("/category/list");

      return result.fold(
            (error) => Result.error(error),
            (data) {
          final categories = (data as List)
              .map((json) => CategoryModel.fromJson(json))
              .toList();
          return Result.ok(categories);
        },
      );
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
