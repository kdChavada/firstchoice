import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/globalvariable.dart';

class Auth {
  SharedPreferences preferences;

  Future<bool> login(String phoneNo, String otpNo) async {
    preferences = await SharedPreferences.getInstance();
    try {
      http.Response response = await http.post(
        "http://firstchoice.9brainz.store/api/v1/login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'HeaderKey': '1Diz0VVcRD5EC7T6FvRgcbsqHng='
        },
        body: jsonEncode({
          'phone_no': phoneNo,
          'login_otp': otpNo,
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        bool isLoginSucess = data['isAuthorized'];
        if (isLoginSucess == true) {
          accessToken.value = data['access_token'];
          await preferences.setBool('isLoggedIn', true);
          await preferences.setString('accessToken', data['access_token']);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
