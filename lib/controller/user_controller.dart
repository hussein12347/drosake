import '../constant/constants.dart';
import '../core/database/sqlite/my_sql_database.dart';

class UserController {
  List dataUser=[];
  UserController(){

  }
  Future<void> insert({required String tableName,required String username}) async {
    MySqlDataBase db = MySqlDataBase();
    bool inserted = await db.insert(
      tableName: kUserTable,
      values: {kUserColumnUsername: username},
    );
    print(inserted);

    await select(tableName:tableName );
  }

  Future<void> select(
      { required String tableName }) async {
    MySqlDataBase db = MySqlDataBase();
  dataUser = await db.select(tableName: tableName);

    print(dataUser);

  }

  Future<void> update(
      {required String tableName,required int id, required Map<String, dynamic> values}) async {
    MySqlDataBase db = MySqlDataBase();
  await db.update(tableName: tableName, id: id, values: values);


  }



}
