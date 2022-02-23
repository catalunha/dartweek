import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guiaapi/data/model/user_model.dart';
import 'package:guiaapi/logic/dio/dio_controller.dart';
import 'package:guiaapi/logic/getconnect/getconnect_controller.dart';

class DioPage extends GetView<DioController> {
// class HttpPage extends StatelessWidget {
  // final HttpController _controller = Get.find<HttpController>();

  DioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio'),
      ),
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final UserModel userModel = state[index];
              return ListTile(
                title: Text(userModel.name),
                subtitle: Text('types: ${userModel.types.length}'),
              );
            },
          );
        },
        onError: (error) {
          return Center(child: Text(error ?? '...'));
        },
      ),
    );
  }
}
