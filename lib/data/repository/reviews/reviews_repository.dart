import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';

class ReviewsRepository {
  final ApiClient _client;

  ReviewsRepository(this._client);

  Future<Result<Map<String, dynamic>>> getRecipeDetail(int id) async {
    final result = await _client.get<Map<String, dynamic>>("/recipes/reviews/detail/$id");
    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(data),
    );
  }
}
