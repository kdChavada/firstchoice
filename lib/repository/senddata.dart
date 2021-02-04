import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Senddata {
  String  mobileNo;
  String  otp;



  Senddata({@required this.mobileNo,@required this.otp});



  factory Senddata.formjson(Map<String , dynamic>json){
    return Senddata(
      mobileNo: json['mobileNo'],
      otp: json['otp']
    );
  }
}