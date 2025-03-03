import '../constant/constants.dart';
import '../core/database/sqlite/my_sql_database.dart';

class UserController {
  List dataUser=[];
  UserController(){
    select(tableName: kUserTable);
    select(tableName: kProductTable);
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
}
