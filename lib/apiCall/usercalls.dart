import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../repository/senddata.dart';

class UserRepository{

  Future<void> getUsersList() async{
    try{
        http.Response response = await http.get(
          "http://firstchoice.9brainz.store/api/v1/users",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
          },
        );
        if (response.statusCode == 200) {
          print(response.statusCode);
          var data = jsonDecode(response.body).toString();
          log(data);
        } else {
          throw Exception('Failed to load data');
      }
    }
    catch(e){
      print(e);
    }
  }
}