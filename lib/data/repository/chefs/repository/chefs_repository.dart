import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/models/chefs_model.dart';
import '../../../../core/utils/result.dart';

class ChefsRepository {
  final ApiClient _dioClient;

  ChefsRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<ChefsModel>> getChef(int id) async {
    try {
      final result = await _dioClient.get('/auth/details/$id');
      return result.fold(
            (error) => Result.error(error),
            (data) => Result.ok(ChefsModel.fromJson(data)),
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
