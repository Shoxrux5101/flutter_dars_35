import 'package:untitled3/data/models/recipe_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';

class TopChefsProfileRepository {
  final ApiClient _dioClient;

  TopChefsProfileRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<List<RecipeModel>>> getChefsRecipes(int chefId) async {
    try {
      final result = await _dioClient.get('/recipes/list?UserId=$chefId');

      return result.fold(
            (error) {
          return Result.error(error);
        },
            (data) {
          if (data is List) {
            final recipes = data.map((e) => RecipeModel.fromJson(e)).toList();
            return Result.ok(recipes);
          } else {
            return Result.error(Exception('xato'));
          }
        },
      );
    } catch (e) {
      return Result.error(Exception(e.toString()));;
    }
  }
}
