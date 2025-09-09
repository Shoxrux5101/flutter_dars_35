import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import '../../models/allergic_model.dart';

class AllergyRepository {
  final ApiClient _apiClient;

  AllergyRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<AllergyModel>>> getAllergies() async {
    try {
      final result = await _apiClient.get('/allergic/list');
      return result.fold(
            (error) => Result.error(error),
            (data) {
          final allergies = (data as List)
              .map((json) => AllergyModel.fromJson(json))
              .toList();
          return Result.ok(allergies);
        },
      );
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
