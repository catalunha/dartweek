import 'package:flutter/material.dart';
import 'loaders.dart';

class TesteLoader extends StatelessWidget {
  const TesteLoader({Key? key}) : super(key: key);
  startLoader() {
    showLoader();
    Future.delayed(Duration(seconds: 3), () => hideLoader());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: TextButton(
        onPressed: startLoader,
        child: Text('Start loader'),
      ),
    );
  }
}
