import 'package:get/get.dart';
import 'package:loader_extensions/data/repository/giphy/giphy_repository.dart';
import 'package:loader_extensions/logic/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GiphyRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(
        giphyRepository: Get.find(),
      ),
    );
  }
}
