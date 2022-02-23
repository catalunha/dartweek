import 'package:get/instance_manager.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';
import 'package:guiaapi/data/repository/user/user_repository_getconnect.dart';
import 'package:guiaapi/data/repository/user/user_repository_http.dart';
import 'package:guiaapi/logic/getconnect/getconnect_controller.dart';
import 'package:guiaapi/logic/http/http_controller.dart';

class GetConnectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IUserRepository>(UserRepositoryGetConnect());
    Get.put<GetConnectController>(
        GetConnectController(iUserRepository: Get.find<IUserRepository>()));
  }
}
