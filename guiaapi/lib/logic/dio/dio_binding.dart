import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';
import 'package:guiaapi/data/repository/user/user_repository_dio.dart';
import 'package:guiaapi/data/repository/user/user_repository_getconnect.dart';
import 'package:guiaapi/data/repository/user/user_repository_http.dart';
import 'package:guiaapi/logic/dio/dio_controller.dart';
import 'package:guiaapi/logic/getconnect/getconnect_controller.dart';
import 'package:guiaapi/logic/http/http_controller.dart';

class DioBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<IUserRepository>(UserRepositoryDio(dio: Get.find<Dio>()));
    Get.put<DioController>(
        DioController(iUserRepository: Get.find<IUserRepository>()));
  }
}
