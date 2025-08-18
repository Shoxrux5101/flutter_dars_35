import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import '../../../models/recipe_model.dart';

class RecipesRepository {
  final ApiClient _dioClient;

  RecipesRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<List<RecipeModel>>> getRecipe() async {
    try {
      final result = await _dioClient.get('/recipes/list');
      return result.fold(
            (error) => Result.error(error),
            (data) {
          final recipes = (data as List)
              .map((json) => RecipeModel.fromJson(json))
              .toList();
          return Result.ok(recipes);
        },
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}