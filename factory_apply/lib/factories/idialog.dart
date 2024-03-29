import 'package:factory_apply/factories/dialog_action.dart';
import 'package:flutter/material.dart';

abstract class IDialog {
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<DialogAction> actions,
  );
}
