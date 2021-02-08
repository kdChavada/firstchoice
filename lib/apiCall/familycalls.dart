import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/repository/FamilyModel.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../repository/globalvariable.dart';
List  userfamily  ;
class FamilyRepository {
  Future<String> getFamily() async {
    try {
      http.Response response = await http.get(
        "http://firstchoice.9brainz.store/api/v1/family",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);


        userfamily = data;

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

}
