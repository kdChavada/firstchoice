import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/repository/senddata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {










  void getUserDetails() async {

      http.Response response = await http.get("http://firstchoice.9brainz.store/api/v1/users",headers: {
        HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },

      );
      if (response.statusCode == 200) {

        var dataget = jsonDecode(response.body);
        print(dataget['user']);

      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }


  }

  @override
  Widget build(BuildContext context) {
    double  h  = MediaQuery.of(context).size.height;
    double  w  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("User List"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            getUserDetails();
            print(accessToken);
          },
          child: Container(
            height: h*0.08,
            width: w*0.3,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
