import 'package:untitled3/core/network/api_client.dart';

import '../../../../core/utils/result.dart';
import '../../../models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient _dioClient;

  ReviewsRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<ReviewsModel>> getReviews(int id) async {
    try {
      final result = await _dioClient.get('/recipes/reviews/details/$id');

      return result.fold(
            (error) => Result.error(error),
            (data) => Result.ok(ReviewsModel.fromJson(data)),
      );
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}

