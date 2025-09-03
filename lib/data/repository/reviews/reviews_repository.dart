import '../../../../core/network/api_client.dart';

class ReviewsRepository {
  final ApiClient _client;

  ReviewsRepository(this._client);

  Future<Map<String, dynamic>> getRecipeDetail(int id) async {
    final result = await _client.get<Map<String, dynamic>>("/recipes/reviews/detail/$id");
    print("RAW RESULT: $result");
    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }
}
