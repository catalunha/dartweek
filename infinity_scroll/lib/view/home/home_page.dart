import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_scroll/controller/view/home/home_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;
  const HomePage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
              initialValue: _controller.limit,
              onSelected: (value) =>
                  _controller.changeTotalPerPage(int.parse(value.toString())),
              itemBuilder: (context) {
                return [
                  CheckedPopupMenuItem(
                    value: 3,
                    checked: _controller.limit == 3,
                    child: Text('3'),
                  ),
                  CheckedPopupMenuItem(
                    value: 6,
                    checked: _controller.limit == 6,
                    child: const Text('aaa'),
                  ),
                ];
              }),
        ],
      ),
      // body: Obx(
      //   () => ListView.builder(
      //     itemCount: _controller.userList.length,
      //     itemBuilder: (_, index) {
      //       final user = _controller.userList[index];
      //       return ListTile(
      //         leading: Text(user.id),
      //         title: Text(user.name),
      //         subtitle: Text(user.username),
      //       );
      //     },
      //   ),
      // ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: () => _controller.nextPage(),
          isLoading: _controller.lastPage,
          child: ListView.builder(
            itemCount: _controller.userList.length,
            itemBuilder: (_, index) {
              final user = _controller.userList[index];
              return ListTile(
                leading: Text(user.id),
                title: Text(user.name),
                subtitle: Text(user.username),
              );
            },
          ),
        ),
      ),
    );
  }
}
