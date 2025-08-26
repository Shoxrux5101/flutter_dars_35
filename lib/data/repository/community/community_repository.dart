import 'package:untitled3/data/models/community_model.dart';

import '../../../core/network/api_client.dart';

class CommunityRepository {
  final ApiClient _apiClient;

  CommunityRepository(this._apiClient);

  Future<List<CommunityModel>> getCommunity() async {
    final result = await _apiClient.get('/recipes/community/list');
    return result.fold(
          (error) => throw Exception(error.toString()),
          (value) {
        return (value)
            .map((json) => CommunityModel.fromJson(json))
            .toList();
      },
    );
  }
}