import 'package:get/get.dart';
import 'package:loader_extensions/data/model/giphy_model.dart';
import 'package:loader_extensions/data/repository/giphy/giphy_repository.dart';

class HomeController extends GetxController with StateMixin {
  final GiphyRepository _giphyRepository;
  // final gifs = <GiphyModel>[].obs;
  HomeController({required GiphyRepository giphyRepository})
      : _giphyRepository = giphyRepository;

//   final _obj = ''.obs;
//   set obj(value) => this._obj.value = value;
//   get obj => this._obj.value;

  @override
  void onInit() {
    super.onInit();
    _giphyRepository.findAll().then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
    }, onError: (error) {
      print(error);
      change(
        null,
        status: RxStatus.error(),
      );
    });
  }
}
