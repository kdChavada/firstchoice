import 'package:firstchoice/repository/FamilyModel.dart';
import 'package:firstchoice/repository/educationmodel.dart';
import 'package:firstchoice/repository/usermodel.dart';
import 'package:flutter/cupertino.dart';


ValueNotifier<List<UserModel>> usersList = ValueNotifier([]);
ValueNotifier<List<FamilyModel>> familyList = ValueNotifier([]);
ValueNotifier<List<EducationModel>> educationList = ValueNotifier([]);


