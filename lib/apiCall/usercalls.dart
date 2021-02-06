import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/constants.dart';
import 'package:firstchoice/repository/usermodel.dart';
import 'package:http/http.dart' as http;

import '../repository/globalvariable.dart';

class UserRepository {
  Future<void> getUsersList() async {
    try {
      http.Response response = await http.get(
        "http://firstchoice.9brainz.store/api/v1/users",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
        },
      );
      if (response.statusCode == 200) {

        var data = jsonDecode(response.body);
        for (Map i in data['user']) {
          usersList.value.add(UserModel.fromJson(i));
        }
        usersList.notifyListeners();
        print(usersList.value);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }
}
