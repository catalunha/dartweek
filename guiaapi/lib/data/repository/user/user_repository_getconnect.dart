import 'dart:convert';

import 'package:get/get.dart';
import 'package:guiaapi/data/model/user_model.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryGetConnect extends GetConnect implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    final response =
        await get('https://62029ce14d21c200170b9916.mockapi.io/innube/users');
    if (response.hasError) {
      throw Exception('Erro ao buscar users');
    }
    List<dynamic> data = response.body;
    return data.map((resp) => UserModel.fromMap(resp)).toList();
  }
}
