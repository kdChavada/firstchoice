import 'package:firstchoice/apiCall/familycalls.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class familyMember extends StatefulWidget {
  @override
  _familyMemberState createState() => _familyMemberState();
}

class _familyMemberState extends State<familyMember> {



  FamilyRepository _familyRepository = FamilyRepository();

  @override
  void initState() {
    _familyRepository.getFamilyList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Family View"),
      ),
      body: Container(
        child: ValueListenableBuilder(
            valueListenable: familyList  ,
            builder: (context, v, c) {
              return ListView.builder(
                itemBuilder: (context, v) {
                  return Card(
                    color: Colors.blue,
                    shadowColor: Colors.greenAccent,
                    elevation: 5.0,
                    child: Container(
                      width: w,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            familyList.value[v].id.toString(),
                            style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                    ),
                  );
                },
                itemCount:familyList.value.length,
              );
            }),
      ),
    );
  }
}
