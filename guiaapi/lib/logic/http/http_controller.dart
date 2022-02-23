import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:guiaapi/data/repository/user/i_user_repository.dart';

class HttpController extends GetxController with StateMixin {
  final IUserRepository _iUserRepository;

  HttpController({required IUserRepository iUserRepository})
      : _iUserRepository = iUserRepository;
  @override
  void onInit() {
    super.onInit();
    findAllUsers();
  }

  Future<void> findAllUsers() async {
    change([], status: RxStatus.loading());
    try {
      final userList = await _iUserRepository.findAllUsers();
      change(userList, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar usuarios'));
    }
  }
}
