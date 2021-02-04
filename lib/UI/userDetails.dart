import 'dart:convert';
import 'dart:io';

import 'package:firstchoice/repository/senddata.dart';
import 'package:firstchoice/repository/userlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Future<UserList> futureData;
  var datalength;

  Future<UserList> getUserDetails() async {
    http.Response response = await http.get(
      "http://firstchoice.9brainz.store/api/v1/users",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      datalength = data['user'].length;
      print(data['user']);
      return UserList.formJson(data['user'][1]);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    futureData = getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("User List"),
      ),
      body: ListView.builder(
        itemCount: datalength == null ? 0 : datalength,
        itemBuilder: (context, index) {
          return Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card(
                //   child: Container(
                //     child: Text(datalength.toString()),
                //     padding: EdgeInsets.all(20.0),
                //   ),
                // ),

                Card(
                  child: Container(
                    child: FutureBuilder<UserList>(
                      future: futureData,
                      builder: (context, val) {
                        if (val.hasData) {
                          return Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text("Name"),
                                  Text("${val.data.name}"),
                                  Text("Phone No"),
                                  Text(" ${val.data.phoneNo}"),
                                  Text("Email"),
                                  Text(" ${val.data.email}"),
                                  Text("Adress"),
                                  Text(" ${val.data.address}"),
                                  Text("Gender"),
                                  Text(" ${val.data.gender}"),
                                  Text("Country"),
                                  Text(" ${val.data.country}"),
                                  Text("Height"),
                                  Text(" ${val.data.height}"),
                                  Text("BirthPlace"),
                                  Text("${val.data.birth_place}"),
                                  Text("Birthdate"),
                                  Text("${val.data.birth_date}"),
                                  Text("BirthTime"),
                                  Text("${val.data.birth_time}"),
                                  Text("livedin"),
                                  Text("${val.data.lived_in}"),
                                  Text("about User"),
                                  Text("${val.data.about_user}"),
                                  Text("material status"),
                                  Text("${val.data.material_status}"),
                                  Text("occuption"),
                                  Text("${val.data.occupation}"),
                                  Text("interest"),
                                  Text("${val.data.interest}"),
                                  Text("created at"),
                                  Text("${val.data.created_at}"),
                                  Text("updated at"),
                                  Text("${val.data.updated_at}"),
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
      // body: FutureBuilder<UserList>(
      //   future: futureData,
      //   builder: (context, val) {
      //     if (val.hasData) {
      //       return Container(
      //         child: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //
      //
      //               Text("Name${val.data.name}"),
      //               Text("PhoneNo${val.data.phoneNo}"),
      //               Text("Email${val.data.email}"),
      //               Text("Adress${val.data.address}"),
      //               Text("Gender${val.data.gender}"),
      //               Text("Country${val.data.country}"),
      //               Text("height${val.data.height}"),
      //
      //
      //             ],
      //           ),
      //         ),
      //       );
      //     } else if (val.hasError) {
      //       return Text("${val.error}");
      //     }
      //     return CircularProgressIndicator();
      //   },
      // ),
    );
  }
}
