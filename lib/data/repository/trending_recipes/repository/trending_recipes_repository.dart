import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import 'package:untitled3/data/models/trending_recipes_model.dart';

class TrendingRecipesRepository {
  final ApiClient _dioClient;
  TrendingRecipesRepository({required ApiClient dioClient})
      : _dioClient = dioClient;

  Future<Result<TrendingRecipesModel>> getTrendingRecipe() async {
    try {
      final result = await _dioClient.get('/recipes/trending-recipe');
      return result.fold(
            (error) {
              return Result.error(error);
            },
            (data) {
              return  Result.ok(TrendingRecipesModel.fromJson(data));
            },
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
  // Future<Result<TrendingRecipesModel>> getTrendingRecipe() async {
  //   try {
  //     final result = await _dioClient.get('/recipes/detail');
  //     return result.fold(
  //           (error) {
  //         return Result.error(error);
  //       },
  //           (data) {
  //         return  Result.ok(TrendingRecipesModel.fromJson(data));
  //       },
  //     );
  //   } on Exception catch (e) {
  //     return Result.error(e);
  //   } catch (e) {
  //
  //     return Result.error(Exception(e.toString()));
  //   }
  // }


}
