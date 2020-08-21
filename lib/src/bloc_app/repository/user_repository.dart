import 'package:flutter_app_learn/src/bloc_app/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  static final String tableName = "t_user";

  static final String userId = "userId";
  static final String userName = "userName";
  static final String phone = "phone";
  static final String avatar = "avatar";
  static final String gender = "gender";
  static final String address = "address";

  static final String createSql = '''
      CREATE TABLE $tableName(
        $userId INTEGER PRIMARY KEY, 
        $userName TEXT, 
        $phone TEXT,
        $avatar TEXT,  
        $gender INTEGER, 
        $address TEXT
      )
  ''';

  Database database;

  UserRepository() {
    database = DatabaseHelper.instance.database;
  }

  addUser(Map<String, dynamic> values) async {
    return await database.insert(tableName, values);
  }

  findAll() async {
    List<Map<String, dynamic>> result = await database?.query(tableName);
    return result;
  }
}
