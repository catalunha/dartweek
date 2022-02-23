import 'dart:convert';
import 'dart:developer';

import 'package:guiaapi/data/model/user_model.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryHttp implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    try {
      final response = await http.get(Uri.parse(
          'https://62029ce14d21c200170b9916.mockapi.io/innube/users'));
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((resp) => UserModel.fromMap(resp)).toList();
    } catch (e) {
      log('Erro em UserRepositoryHttp.findAllUsers');
      rethrow;
    }
  }
}
