import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guiaapi/logic/dio/dio_binding.dart';
import 'package:guiaapi/logic/getconnect/getconnect_binding.dart';
import 'package:guiaapi/logic/http/http_binding.dart';
import 'package:guiaapi/ui/dio/dio_page.dart';
import 'package:guiaapi/ui/getconnect/getconnect_page.dart';
import 'package:guiaapi/ui/home/home_page.dart';
import 'package:guiaapi/ui/http/http_page.dart';

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
          page: () => HomePage(),
          children: [
            GetPage(
              name: '/http',
              binding: HttpBinding(),
              page: () => HttpPage(),
            ),
            GetPage(
              name: '/getconnect',
              binding: GetConnectBinding(),
              page: () => GetConnectPage(),
            ),
            GetPage(
              name: '/dio',
              binding: DioBinding(),
              page: () => DioPage(),
            ),
          ],
        ),
      ],
    );
  }
}
