import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/constants.dart';
import 'package:firstchoice/repository/educationmodel.dart';
import 'package:firstchoice/repository/globalvariable.dart';
import 'package:http/http.dart' as http;




class EducationRepository {





  Future<void> getEducationList() async {
    try {
      http.Response response = await http.get(
        "http://firstchoice.9brainz.store/api/v1/education",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
        },
      );
      if (response.statusCode == 200) {

        var data = jsonDecode(response.body);
        print("1");
        print(data['user']);
        for (Map i in data['user']) {
          print(i);
          educationList.value.add(EducationModel.fromJson(i));
        }
        educationList.notifyListeners();
        print(educationList.value);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

}
