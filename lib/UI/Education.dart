import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firstchoice/repository/education.dart';
import 'package:firstchoice/repository/globalvariable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class edushowlist extends StatefulWidget {
  @override
  _edushowlistState createState() => _edushowlistState();
}

class _edushowlistState extends State<edushowlist> {
  Future<Education> _education;

  var datalength;

  var data;

  Future<Education> getEducationList() async {
    http.Response response = await http.get(
      "http://firstchoice.9brainz.store/api/v1/education",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      data = jsonDecode(response.body).toString();

      log(data);


      //datalength = data['user'].length;
      //return   Family.formJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void setState(fn) {
    _education = getEducationList();
    super.setState(fn);
  }

  @override
  void initState() {
    _education = getEducationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Education"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                "${data.toString()}",
                textScaleFactor: 0.85,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





