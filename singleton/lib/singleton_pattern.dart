import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:singleton/database/connection.dart';
import 'package:singleton/singleton/singleton_factory.dart';
import 'package:singleton/singleton/singleton_raiz.dart';

class SingletonPattern extends StatefulWidget {
  const SingletonPattern({Key? key}) : super(key: key);

  @override
  State<SingletonPattern> createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {
  List<String> nomes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // int i = 0;
    // while (i < 10) {
    //   log(SingletonFactory().id.toString());
    //   log(SingletonFactory().id.toString());

    //   i++;
    // }
    buscarNomes();
  }

  void buscarNomes() async {
    var db = await Connection.instance!.db;
    var result = await db.rawQuery('select * from teste');
    setState(() {
      nomes = result.map<String>((e) => e['nome'].toString()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singleton'),
      ),
      body: Container(),
    );
  }
}
