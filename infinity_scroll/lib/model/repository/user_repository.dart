import 'package:dio/dio.dart';
import 'package:infinity_scroll/model/data/pagination_filter.dart';
import 'package:infinity_scroll/model/data/user_model.dart';

class UserRepository {
  Dio _dio;
  UserRepository({
    required Dio dio,
  }) : _dio = dio;
  Future<List<UserModel>> findAll(PaginationFilter paginationFilter) async {
    final resp = await _dio.get(
      '/users',
      queryParameters: {
        'page': paginationFilter.page,
        'limit': paginationFilter.limit
      },
    );
    return resp.data
        .map<UserModel>(
          (u) => UserModel.fromMap(u),
        )
        .toList();
  }
}
