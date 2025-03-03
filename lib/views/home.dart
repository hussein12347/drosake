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
  final TextEditingController _userNameEditController = TextEditingController();
  final UserController _userController = UserController();

  @override
  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    await _userController.select(tableName: kUserTable);
  }

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
                  await _userController.insert(
                      username: _userNameController.text,
                      tableName: kUserTable);
                  _userController.select(tableName: kUserTable);
                  setState(() {
                    _userNameController.clear();
                  });
                },
                child: const Text("insert")),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          _userNameEditController.text =
                              _userController.dataUser[index]['username'];

                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              int id = _userController.dataUser[index]['id'];
                              return Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _userNameEditController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text("user name")),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              await _userController.update(
                                                  tableName: kUserTable,
                                                  id: id,
                                                  values: {
                                                    kUserColumnUsername:
                                                        _userNameEditController
                                                            .text
                                                  });
                                              await _userController.select(
                                                  tableName: kUserTable);
                                              setState(() {
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text("update")),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text("delete")),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "id: ${_userController.dataUser[index]['id']}"),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "name: ${_userController.dataUser[index]['username']}"),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
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
