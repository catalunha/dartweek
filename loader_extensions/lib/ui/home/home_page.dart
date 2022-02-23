import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_extensions/logic/home/home_controller.dart';
import 'package:loader_extensions/ui/home/grid_gifs.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: controller.obx(
        (state) => GridGifs(giphyList: state),
        onError: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }
}
