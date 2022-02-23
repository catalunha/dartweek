import 'dart:io';

import 'package:factory_apply/factories/android_dialog.dart';
import 'package:factory_apply/factories/dialog_action.dart';
import 'package:factory_apply/factories/idialog.dart';
import 'package:factory_apply/factories/ios_dialog.dart';
import 'package:flutter/material.dart';

class DialogFactory {
  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future<T?> showAlertDialog<T>(
    BuildContext context, {
    Widget title = const Text('Não informado'),
    Widget content = const Text('Não informado'),
    List<DialogAction>? actions,
    bool forceAndroid = false,
    bool forceIOS = false,
  }) {
    IDialog dialogData;
    if ((Platform.isIOS || forceIOS) && !forceAndroid) {
      dialogData = IOSDialog();
    } else if ((Platform.isAndroid || forceAndroid) && !forceIOS) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: context,
      builder: (context) => dialogData.create(
        context,
        title,
        content,
        actions ?? [],
      ),
    );
  }
}
