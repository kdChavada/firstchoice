import 'dart:ui';

import 'package:firstchoice/UI/educationlistpage.dart';
import 'package:firstchoice/UI/userlistpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Famaly list.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("DashBord"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserListPage()));
                  },
                  child: Card(
                    shadowColor: Colors.green,
                    elevation: 10.0,
                    child: Container(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: Center(
                        child: Text(
                          "User",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => familyMember()));
                  },
                  child: Card(
                    shadowColor: Colors.green,
                    elevation: 10.0,
                    child: Container(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: Center(
                        child: Text(
                          "Family",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EducationListPage()));

                  },
                  child: Card(
                    shadowColor: Colors.green,
                    elevation: 10.0,
                    child: Container(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: Center(
                        child: Text(
                          "Education",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    shadowColor: Colors.green,
                    elevation: 10.0,
                    child: Container(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: Center(
                        child: Text(
                          "Loading..",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
