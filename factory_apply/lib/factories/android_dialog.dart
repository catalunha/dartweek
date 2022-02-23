import 'package:factory_apply/factories/dialog_action.dart';
import 'package:factory_apply/factories/idialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogAction>? actions) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions?.map<Widget>((a) {
        return TextButton(child: a.child, onPressed: a.onPressed);
      }).toList(),
    );
  }
}
