import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firstchoice/repository/globalvariable.dart';
import 'package:firstchoice/repository/userlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<UserList> _userlist = new List<UserList>();

  Future<List<UserList>> fetchrecord() async {
    try {
      final http.Response response = await http
          .get("http://firstchoice.9brainz.store/api/v1/users", headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      });


      if (response.statusCode == 200) {
        print(response.body);


       // log(response.body);
        List<dynamic> values = new List<dynamic>();

        values = json.decode(response.body);
        if (values.length > 0) {
          for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
              Map<String, dynamic> map = values[i];
              _userlist.add(UserList.fromJson(map));
              debugPrint('Id-------${map['id']}');
            }
          }
        }
        return _userlist;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Testing"),
      ),
      body: GestureDetector(
        onTap: () {
          fetchrecord();
        },
        child: Center(
          child: Container(
            height: 120.0,
            width: 90.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  void setState(fn) {
    fetchrecord();
    super.setState(fn);
  }
}
