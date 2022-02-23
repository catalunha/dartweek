import 'package:dio/dio.dart';
import 'package:guiaapi/data/model/user_model.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';

class UserRepositoryDio implements IUserRepository {
  final Dio _dio;

  UserRepositoryDio({required Dio dio}) : _dio = dio;
  @override
  Future<List<UserModel>> findAllUsers() async {
    try {
      final response = await _dio
          .get('https://62029ce14d21c200170b9916.mockapi.io/innube/users');
      List<dynamic> data = response.data;

      return data.map((resp) => UserModel.fromMap(resp)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
