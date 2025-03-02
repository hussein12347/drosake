import 'crud.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqlDatabase;
class MySqlDataBase extends CRUD{
  initDatabase() async {
    String databasePath = await sqlDatabase.getDatabasesPath();

    String DatabaseName="management.db";
    String realDatabasePath=join(databasePath,DatabaseName);
    int version = 1;
    sqlDatabase.openDatabase(realDatabasePath,version: version,onCreate: (db, version) {

    },);

  }
  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> select() {
    // TODO: implement select
    throw UnimplementedError();
  }

  @override
  Future<void> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

}