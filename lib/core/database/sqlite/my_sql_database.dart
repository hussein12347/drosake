import 'package:sqflite/sqflite.dart';

import '../../../constant/constants.dart';
import 'crud.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqlDatabase;

class MySqlDataBase extends CRUD {
  // final String kUserTable = "users";
  // final String kUserColumnID = "id";
  // final String kUserColumnUsername = "username";
  // final String kProductTable = "products";
  // final String kProductColumnID = "product_id";
  // final String kProductColumnName = "product_name";
  // final String kProductColumnPrice = "product_price";
  // final String kProductColumnCount = "product_count";
  // final String kSalesTable = "sales";
  // final String kSalesColumnID = "sales_id";
  // final String kSalesColumnUsername = "sales_username";
  // final String kSalesColumnProductName = "sales_product_name";

  Database? _db;

  Future<Database?> _initDatabase() async {
    String databasePath = await sqlDatabase.getDatabasesPath();

    String databaseName = "management.db";
    String realDatabasePath = join(databasePath, databaseName);
    int version = 1;
    _db ??= await sqlDatabase.openDatabase(
      realDatabasePath,
      version: version,
      onCreate: _onCreate,
    );
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $kUserTable($kUserColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $kUserColumnUsername TEXT)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $kProductTable($kProductColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $kProductColumnName TEXT ,$kProductColumnPrice REAL ,$kProductColumnCount  INTEGER )");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $kSalesTable($kSalesColumnID INTEGER PRIMARY KEY AUTOINCREMENT,$kSalesColumnProductName TEXT , $kSalesColumnUsername TEXT )");
  }



  @override

  Future<bool> delete() async {
    if (_db == null) {
      await _initDatabase(); // Initialize the database if it's not already
    }
    // TODO: implement delete
    int? deleted = await _db?.delete(
      kUserTable,
      where: "$kUserColumnID == 36",
    );
    await _db?.close();
    return deleted! > 0 ? true : false;
  }

  @override
  Future<bool> insert({required String tableName,required Map<String, dynamic> values}) async {
    if (_db == null) {
      await _initDatabase(); // Initialize the database if it's not already
    }

    // TODO: implement insert
    int? inserted = await _db?.insert(tableName, values);
    await _db?.close();
    return inserted! > 0 ? true : false;
  }

  @override
  Future<List<Map<String, Object?>>>  select({required String tableName}) async {
    if (_db == null) {
      await _initDatabase(); // Initialize the database if it's not already
    }

    // TODO: implement insert
    List<Map<String, Object?>>? data = await _db?.query(tableName,);
    await _db?.close();
    return data!;
  }

  @override
  Future<bool> update() async {
    if (_db == null) {
      await _initDatabase(); // Initialize the database if it's not already
    }
    // TODO: implement update
    int? updated = await _db?.update(
      kUserTable,
      {
        kUserColumnUsername: "hussein",
      },
      where: "$kUserColumnID == 2",
    );
    await _db?.close();
    return updated! > 0 ? true : false;
  }
}
