import 'dart:convert';
import 'package:alert/alert.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firstchoice/UI/userDetails.dart';
import 'package:firstchoice/repository/senddata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;
import 'package:alert/alert.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {

   final Mobile  = TextEditingController();
  final Otp = TextEditingController();

    String phoneNo;
    String otpNo;


  @override
  void dispose() {
    Mobile.dispose();
    Otp.dispose();
    super.dispose();
  }


  var token;
  bool isLoginSucess;

  void getdata() async {

     http.Response response = await http.post("http://firstchoice.9brainz.store/api/v1/login", headers: <String , String> {

       'Content-Type': 'application/json; charset=UTF-8',
       'HeaderKey' : '1Diz0VVcRD5EC7T6FvRgcbsqHng='

    },
    body: jsonEncode(<String , dynamic>{
      'phone_no' : phoneNo,
      'login_otp' : otpNo,
    })
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
       var  data = jsonDecode(response.body);

       isLoginSucess = data['isAuthorized'];
       if(isLoginSucess ==  true )
         {
           accessToken = data['access_token'];
           CoolAlert.show(
             context: context,
             type: CoolAlertType.success,
             text: "Your transaction was successful!",
           );
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => UserDetails()),
           );
         }
       else
         {
           Alert(message: "Faild").show();
         }

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }


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
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  minRadius: 50.0,
                ),
              ),
            ),
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
            GestureDetector(

              onTap: (){
                setState(() {
                    phoneNo=Mobile.text;
                    otpNo=Otp.text;
                });

                getdata();
              },


              child: Container(
                height: h * 0.1,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
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
