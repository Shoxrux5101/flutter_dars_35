import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';
import '../../models/following_model.dart';

class FollowingRepository {
  final ApiClient apiClient;
  FollowingRepository({required this.apiClient});

  Future<Result<List<FollowingModel>>> fetchFollowing() async {
    final result = await apiClient.get("/user/following");

    return result.fold(
          (error) => Result.error(error),
          (data) {
        final following = (data as List)
            .map((e) => FollowingModel.fromJson(e))
            .toList();
        return Result.ok(following);
      },
    );
  }
}
