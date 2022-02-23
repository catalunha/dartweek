import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static const Version = 1;
  static const DatabaseName = 'singleton';
  Database? _db;
  static Connection? _instance;
  Connection._();
  static Connection? get instance {
    _instance ??= Connection._();
    return _instance;
  }

  Future<Database> get db async {
    return await _openDatabaseConnection();
  }

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    print(databasePath);
    var path = join(databasePath, DatabaseName);
    if (_db == null) {
      await openDatabase(
        path,
        version: Version,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
    }
    return _db!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('create table teste(nome varchar(200))');
    db.execute('insert into teste values(marcio)');
    db.execute('insert into teste values(jose)');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}
}
