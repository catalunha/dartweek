import 'package:get/instance_manager.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';
import 'package:guiaapi/data/repository/user/user_repository_http.dart';
import 'package:guiaapi/logic/http/http_controller.dart';

class HttpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IUserRepository>(UserRepositoryHttp());
    Get.put<HttpController>(
        HttpController(iUserRepository: Get.find<IUserRepository>()));
  }
}
