import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firstchoice/repository/familydata.dart';
import 'package:firstchoice/repository/senddata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class familyMember extends StatefulWidget {
  @override
  _familyMemberState createState() => _familyMemberState();
}

class _familyMemberState extends State<familyMember> {
  Future<Family> _familydata;

  var datalength;

  Future<Family>  getFamilyList() async {
    http.Response response = await http.get(
      "http://firstchoice.9brainz.store/api/v1/family",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      var data = jsonDecode(response.body).toString();

      log(data);

      //datalength = data['user'].length;
      //return   Family.formJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void setState(fn) {
    _familydata = getFamilyList();
    super.setState(fn);
  }

  @override
  void initState() {
    _familydata = getFamilyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("family"),
      ),
      body: ListView.builder(
        itemCount: datalength == null ? 0 : datalength,
        itemBuilder: (context, index) {
          return Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                    child: FutureBuilder<Family>(
                      future: _familydata,
                      builder: (context, val) {
                        if (val.hasData) {
                          return Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text("Name"),
                                  Text("${val.data.motherName}"),
                                ],
                              ),
                            ),
                          );
                        } else if (val.hasError) {
                          return Text("${val.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
