import 'package:get/get.dart';
import 'package:infinity_scroll/model/data/pagination_filter.dart';
import 'package:infinity_scroll/model/data/user_model.dart';
import 'package:infinity_scroll/model/repository/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository _repository;
  HomeController({
    required UserRepository repository,
  }) : _repository = repository;

  final _userList = <UserModel>[].obs;
  List<UserModel> get userList => _userList.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  bool get lastPage => _lastPage.value;
  @override
  void onInit() {
    _changePaginationFilter(1, 2);
    _findUserList();
    ever(_paginationFilter, (_) => _findUserList());
    super.onInit();
  }

  void _findUserList() async {
    print('_findUserList $_paginationFilter');
    final userList = await _repository.findAll(_paginationFilter.value);
    if (userList.isEmpty) {
      _lastPage.value = true;
    }
    _userList.addAll(userList);
  }

  void changeTotalPerPage(int limitValue) {
    _userList.clear();
    _lastPage.value = false;

    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void nextPage() {
    _changePaginationFilter(_page + 1, limit);
  }
}
