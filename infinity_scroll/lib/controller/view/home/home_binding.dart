import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinity_scroll/controller/view/home/home_controller.dart';
import 'package:infinity_scroll/model/repository/user_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<Dio>(
    //   () => Dio(),
    // );
    Get.lazyPut<UserRepository>(
      () => UserRepository(
        dio: Get.find(),
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: Get.find(),
      ),
    );
  }
}
