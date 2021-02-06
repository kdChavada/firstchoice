import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/Login Screen.dart';
import 'UI/userDetails.dart';
import 'repository/senddata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;



  void getSharedPreferences()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
    accessToken.value = preferences.getString('accessToken');
  }



  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First choice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:isLoggedIn ? UserDetails() : Login(),
    );
  }
}





