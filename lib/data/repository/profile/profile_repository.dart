import '../../../core/network/api_client.dart';
import '../../../core/utils/result.dart';
import '../../models/profile_model.dart';

class ProfileRepository {
  final ApiClient apiClient;
  ProfileRepository({required this.apiClient});
  Future<Result<ProfileModel>> getProfile() async {
    final result = await apiClient.get("/auth/me");
    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(ProfileModel.fromJson(data)),
    );
  }
}
