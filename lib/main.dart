import 'package:flutter/material.dart';

import 'UI/Login Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First choice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}





