import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import '../../models/recipe_model.dart';

class RecipesRepository {
  final ApiClient _apiClient;

  RecipesRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<RecipeModel>>> getRecipe() async {
    try {
      final result = await _apiClient.get('/recipes/list');
      return result.fold(
            (error)  {

              return Result.error(error);},
            (data) {

              final recipes = (data as List)
                  .where((e) => e != null)
                  .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
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