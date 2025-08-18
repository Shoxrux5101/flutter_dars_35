import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import 'package:untitled3/data/models/category_details_model.dart';

class CategoryDetailsRepository {
  final ApiClient _dioClient;

  CategoryDetailsRepository({required ApiClient dioClient})
      : _dioClient = dioClient;

  Future<Result<CategoryDetailsModel>> getCategoryDetails() async {
    try {
      final result = await _dioClient.get("/category/detail");

      return result.fold(
            (error) => Result.error(error),
            (data) => Result.ok(CategoryDetailsModel.fromJson(data)),
      );
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
