import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_scroll/controller/aplication/aplication_bindings.dart';
import 'package:infinity_scroll/controller/view/home/home_binding.dart';

import 'view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AplicationBindings(),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBinding(),
          page: () => HomePage(
            Get.find(),
          ),
        ),
      ],
    );
  }
}
