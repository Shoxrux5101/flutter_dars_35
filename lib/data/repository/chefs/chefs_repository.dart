import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/models/chefs_model.dart';
import '../../../core/utils/result.dart';

class ChefsRepository {
  final ApiClient _dioClient;

  ChefsRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result<List<ChefsModel>>> getChefs(List<int> ids) async {
    try {
      final List<ChefsModel> chefs = [];
      for (final id in ids) {
        final result = await _dioClient.get('/auth/details/$id');

        result.fold(
              (error) {
            print("Chef $id yuklab bo‘lmadi: $error");
          },
              (data) {
            if (data is Map<String, dynamic>) {
              chefs.add(ChefsModel.fromJson(data));
            } else {
              print("Backend noto‘g‘ri format qaytardi: $data");
            }
          },
        );
      }
      return Result.ok(chefs);
    } catch (e, s) {
      print("Exception: $e");
      print(s);
      return Result.error(Exception(e.toString()));
    }
  }
  Future<Result<List<ChefsModel>>> getLikedChefs(List<int> ids) async {
    try {
      final List<ChefsModel> chefs = [];

      for (final id in ids) {
        final result = await _dioClient.get('/auth/details/$id');

        result.fold(
              (error) {
            print("Chef $id yuklab bo‘lmadi: $error");
          },
              (data) {
            if (data is Map<String, dynamic>) {
              chefs.add(ChefsModel.fromJson(data));
            } else {
              print("Backend noto‘g‘ri format qaytardi: $data");
            }
          },
        );
      }
      return Result.ok(chefs);
    } catch (e, s) {
      print("Exception: $e");
      print(s);
      return Result.error(Exception(e.toString()));
    }
  }
  Future<Result<List<ChefsModel>>> getNewChefs(List<int> ids) async {
    try {
      final List<ChefsModel> chefs = [];

      for (final id in ids) {
        final result = await _dioClient.get('/auth/details/$id');

        result.fold(
              (error) {
            print("Chef $id yuklab bo‘lmadi: $error");
          },
              (data) {
            if (data is Map<String, dynamic>) {
              chefs.add(ChefsModel.fromJson(data));
            } else {
              print("Backend noto‘g‘ri format qaytardi: $data");
            }
          },
        );
      }

      return Result.ok(chefs);
    } catch (e, s) {
      print("Exception: $e");
      print(s);
      return Result.error(Exception(e.toString()));
    }
  }
}
