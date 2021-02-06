import 'dart:convert';
import 'dart:io';
import 'package:firstchoice/repository/FamilyModel.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../repository/globalvariable.dart';

class FamilyRepository {

  Future<void> getFamilyList() async{
    try{
       http.Response response = await http.get(
        "http://firstchoice.9brainz.store/api/v1/family",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}"
        },
      );
      if (response.statusCode == 200) {
         var   data = jsonDecode(response.body);
          print(data);
        for(Map j in data["user"] ){
           familyList.value.add(FamilyModel.fromJson(j));
        }
        familyList.notifyListeners();
        print(familyList.value);
      }
      else {
        throw Exception('Failed to load data');
      }
    }
    catch(e){
      print(e);
    }
  }
}