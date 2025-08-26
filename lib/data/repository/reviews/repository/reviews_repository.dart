import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../../../models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient _dioClient;

  ReviewsRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<ReviewsModel>> getRecipeReviews(int recipeId) async {
    print(recipeId);
    try {
      final result = await _dioClient.get('/recipes/reviews/detail/$recipeId');

      return result.fold(
            (error) => Result.error(error),
            (data) {
          final recipe = ReviewsModel.fromJson(data);
          return Result.ok(recipe);
        },
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
