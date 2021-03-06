import 'package:firstchoice/apiCall/educationcall.dart';
import 'package:firstchoice/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationListPage extends StatefulWidget {
  @override
  _EducationListPageState createState() => _EducationListPageState();
}

class _EducationListPageState extends State<EducationListPage> {
  EducationRepository _educationRepository = EducationRepository();

  @override
  void initState() {
    _educationRepository.getEducationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Education"),
      ),
      body: Container(
        child: ValueListenableBuilder(
            valueListenable: educationList,
            builder: (context, v, c) {
              return ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                    shadowColor: Colors.greenAccent,
                    elevation: 5.0,
                    child: Container(
                      width: w,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            educationList.value[i].id.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].schoolName,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].schoolPassingYear,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].collegeName,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].collegePassingYear,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].collegeLocation,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            educationList.value[i].qualification,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: educationList.value.length,
              );
            }),
      ),
    );
  }
}
