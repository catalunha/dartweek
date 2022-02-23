import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_extensions/logic/home/home_binding.dart';
import 'package:loader_extensions/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBinding(),
          page: () => HomePage(),
        ),
      ],
    );
  }
}
