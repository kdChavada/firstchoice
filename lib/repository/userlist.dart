import 'package:flutter/cupertino.dart';

class UserList {
  int id;
  String name;
  String phoneNo;
  String email;
  String address;
  String gender;
  String country;
  String height;
  String birth_place;
  String birth_date;
  String birth_time;
  String lived_in;
  String about_user;
  String material_status;
  String occupation;
  String interest;
  String created_at;
  String updated_at;

  UserList({
    @required this.id,
    this.name,
    this.phoneNo,
    this.email,
    this.address,
    this.gender,
    this.country,
    this.height,
    this.birth_place,
    this.birth_date,
    this.birth_time,
    this.lived_in,
    this.about_user,
    this.material_status,
    this.occupation,
    this.interest,
    this.created_at,
    this.updated_at,
  });

  factory UserList.formJson(Map<String, dynamic> json) {
    return UserList(
        id: json['id'],
        name: json['name'],
        phoneNo: json['phone_no'],
        email: json['email'],
        address: json['address'],
        gender: json['gender'],
        country: json['country'],
        birth_place: json['birth_place'],
        birth_date: json['birth_date'],
        birth_time: json['birth_time'],
        lived_in: json['lived_in'],
        about_user: json['about_user'],
        material_status: json['material_status'],
        occupation: json['occupation'],
        interest: json['interest'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        height: json['height'].toString());
  }
}
