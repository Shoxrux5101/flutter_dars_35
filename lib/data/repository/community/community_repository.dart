import 'package:untitled3/data/models/community_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';

class CommunityRepository {
  final ApiClient _apiClient;

  CommunityRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CommunityModel>>> getCommunity() async {
    final result = await _apiClient.get('/recipes/community/list');

    return result.fold(
          (error) => Result.error(error),
          (value) {
        try {
          if (value is List) {
            final List<CommunityModel> communities = value.map<CommunityModel>((item) {
              return CommunityModel.fromJson(item);
            }).toList();

            return Result.ok(communities);
          } else {
            return Result.error(Exception('Expected List but gtot ${value.runtimeType}'));
          }
        } catch (e) {
          return Result.error(Exception('Failed to parse communities: $e'));
        }
      },
    );
  }
}