import 'dart:ui';

import 'package:alert/alert.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firstchoice/UI/Dashbord.dart';
import 'package:firstchoice/apiCall/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Mobile = TextEditingController();
  final Otp = TextEditingController();

  Auth auth = Auth();

  @override
  void dispose() {
    Mobile.dispose();
    Otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: TextField(
                controller: Mobile,
                decoration: InputDecoration(
                  hintText: "Enter Mobile Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: TextField(
                controller: Otp,
                decoration: InputDecoration(
                  hintText: "Enter Otp Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: () async {
                bool isauthorised = await auth.login(Mobile.text, Otp.text);
                if (isauthorised) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Your transaction was successful!",
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => UserDetails()),
                  );
                } else {
                  Alert(message: "Faild").show();
                }
              },
              child: Container(
                height: h * 0.09,
                width: w * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
