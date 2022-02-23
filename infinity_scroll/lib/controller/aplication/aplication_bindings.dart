import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://62029ce14d21c200170b9916.mockapi.io/innube')));
  }
}
