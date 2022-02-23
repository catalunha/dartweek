import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension LoaderStatelessExtensions on StatelessWidget {
  showLoader() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  hideLoader() {
    Get.back();
  }
}

extension LoaderStateFulExtensions on StatefulWidget {
  showLoader() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  hideLoader() {
    Get.back();
  }
}
