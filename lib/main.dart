import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/Login Screen.dart';
import 'UI/Dashbord.dart';
import 'repository/globalvariable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn;

  void getSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken.value = preferences.getString('accessToken');
    setState(() {
      isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoggedIn);
    print(accessToken.value);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First choice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn == null
          ? Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : isLoggedIn
              ? UserDetails()
              : Login(),
    );
  }
}
