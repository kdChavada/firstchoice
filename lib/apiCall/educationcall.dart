import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/repository/educationmodel.dart';
import 'package:firstchoice/repository/globalvariable.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class EducationRepository {
  Future<void> getEducationList() async {
    try {
      http.Response response =
          await http.get("http://firstchoice.9brainz.store/api/v1/education",

            headers: {

              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
            },
          );
      if(response.statusCode == 200)
        {
          var data = jsonDecode(response.body);
          for (Map i in data['user']) {
            educationList.value.add(EducationModel.fromJson(i));
          }
          usersList.notifyListeners();

        }
      else {
        print("Un Able Load Data");
      }
    } catch (e) {
      print('Error 404 not Fount ');
      print(e);
    }
  }
}
