import '../constant/constants.dart';
import '../core/database/sqlite/my_sql_database.dart';

class UserController {
  List dataUser=[];
  UserController(){
    selectUser();
  }
  Future<void> insertUser({required String username}) async {
    MySqlDataBase db = MySqlDataBase();
    bool inserted = await db.insert(
      tableName: kUserTable,
      values: {kUserColumnUsername: username},
    );
    print(inserted);

    await selectUser();
  }

  Future<void> selectUser(
      { String tableName = kUserTable}) async {
    MySqlDataBase db = MySqlDataBase();
  dataUser = await db.select(tableName: tableName);

    print(dataUser);

  }
}
