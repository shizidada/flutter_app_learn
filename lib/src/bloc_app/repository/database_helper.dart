import 'dart:async';

import 'package:flutter_app_learn/src/bloc_app/repository/user_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String databasesName = "my_db.db";

  static const int _version = 1;

  Database database;

  // 工厂模式
  factory DatabaseHelper() => _getInstance();

  static DatabaseHelper get instance => _getInstance();
  static DatabaseHelper _instance;

  static DatabaseHelper _getInstance() {
    if (_instance == null) {
      _instance = DatabaseHelper._internal();
    }
    return _instance;
  }

  DatabaseHelper._internal() {
    // 初始化
    init();
  }

  init() async {
    if (null != database) {
      return database;
    }

    database = await initializer();

    return database;
  }

  initializer() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databasesName);

    var database = await openDatabase(path,
        version: _version,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);

    return database;
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    Batch batch = db.batch();

    print('onUpgrade $oldVersion $newVersion');

    if (oldVersion == 1) {
    } else if (oldVersion == 2) {
    } else if (oldVersion == 3) {}
    oldVersion++;
    // 升级后版本还低于当前版本，继续递归升级
    if (oldVersion < newVersion) {
      _onUpgrade(db, oldVersion, newVersion);
    }
    await batch.commit();
  }

  _onCreate(Database db, int version) async {
    await db.execute(UserRepository.createSql);
  }

  FutureOr<void> _onDowngrade(
      Database db, int oldVersion, int newVersion) async {
    Batch batch = db.batch();

    await batch.commit();
  }

  Future<bool> isTableExists(String table) async {
    String sql =
        "select * from Sqlite_master where type='table' and name= '$table'";
    var result = await database.rawQuery(sql);
    return result != null && result.length > 0;
  }

  tableName() async {
    String sql = "select * from Sqlite_master where type='table' ";
    var result = await database.rawQuery(sql);
    result.forEach((element) {
      print(element.toString());
    });
  }

  close() {
    if (database != null) {
      database.close();
      database = null;
    }
  }
}
