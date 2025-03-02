import 'package:sqflite/sqflite.dart';

import 'crud.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqlDatabase;

class MySqlDataBase extends CRUD {
  final String _userTable = "users";
  final String _userColumnID = "id";
  final String _userColumnUsername = "username";
  final String _productTable = "products";
  final String _productColumnID = "product_id";
  final String _productColumnName = "product_name";
  final String _productColumnPrice = "product_price";
  final String _productColumnCount = "product_count";
  final String _salesTable = "sales";
  final String _salesColumnID = "sales_id";
  final String _salesColumnUsername = "sales_username";
  final String _salesColumnProductName = "sales_product_name";

  initDatabase() async {
    String databasePath = await sqlDatabase.getDatabasesPath();

    String databaseName = "management.db";
    String realDatabasePath = join(databasePath, databaseName);
    int version = 1;
    sqlDatabase.openDatabase(
      realDatabasePath,
      version: version,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_userTable($_userColumnID INTEGER , $_userColumnUsername TEXT)");
    await db.execute(
        "CREATE TABLE $_productTable($_productColumnID INTEGER , $_productColumnName TEXT ,$_productColumnPrice REAL ,$_productColumnCount  INTEGER )");
    await db.execute(
        "CREATE TABLE $_salesTable($_salesColumnID INTEGER  ,$_salesColumnProductName TEXT , $_salesColumnUsername TEXT )");
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
