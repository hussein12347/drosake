import 'package:drosake/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controller/user_controller.dart';
import '../core/database/sqlite/my_sql_database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _userNameController = TextEditingController();
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("user name")),
            ),
            TextButton(
                onPressed: () async {
                  await _userController.insertUser(
                      username: _userNameController.text);
                  MySqlDataBase MySqlDataBas=MySqlDataBase();

                  await MySqlDataBas.delete();

                  setState(()  {
                    _userNameController.clear();
                  });
                },
                child: const Text("insert")),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("id: ${_userController.dataUser[index]['id']}"),
                          const SizedBox(height: 5,),
                          Text("name: ${_userController.dataUser[index]['username']}"),
                        ],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: _userController.dataUser.length),
            )
          ],
        ),
      ),
    );
  }
}
