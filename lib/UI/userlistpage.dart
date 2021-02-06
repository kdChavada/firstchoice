import 'package:firstchoice/apiCall/usercalls.dart';
import 'package:firstchoice/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  UserRepository repo = UserRepository();


  @override
  void initState() {
    repo.getUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("User Detail"),
      ),
      body: Container(
        child: ValueListenableBuilder(
            valueListenable: usersList,
            builder: (context, v, c) {
              return ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                   shadowColor: Colors.greenAccent,
                    elevation: 5.0,
                    child: Container(
                      width: w,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            usersList.value[i].id.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            usersList.value[i].name,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            usersList.value[i].email,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            usersList.value[i].phone_no,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            usersList.value[i].address,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: usersList.value.length,
              );
            }),
      ),
    );
  }
}
