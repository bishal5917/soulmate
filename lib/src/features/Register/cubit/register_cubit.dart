import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController _regNameController = TextEditingController();
  final TextEditingController _regEmailController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();
  final TextEditingController _regPhoneController = TextEditingController();
  final TextEditingController _regBirthYearController = TextEditingController();
  final TextEditingController _regGenderController = TextEditingController();

  late File _image1;
  late File _image2;
  String _yselectedValue = "1993";
  String _yHobby1Value = "coding";
  String _yHobby2Value = "travelling";
  String _yHobby3Value = "mountain biking";
  String _gSelectedValue = "male";

  TextEditingController get regNameController => _regNameController;
  TextEditingController get regEmailController => _regEmailController;
  TextEditingController get regPasswordController => _regPasswordController;
  TextEditingController get regPhoneController => _regPhoneController;
  TextEditingController get regBirthYearController => _regBirthYearController;
  TextEditingController get regGenderController => _regGenderController;
  String get getYearValue => _yselectedValue;
  String get getGenderValue => _gSelectedValue;
  String get gethobby1Value => _yHobby1Value;
  String get gethobby2Value => _yHobby2Value;
  String get gethobby3Value => _yHobby3Value;
  File get image1 => _image1;
  File get image2 => _image2;

  List<DropdownMenuItem<String>> get yearItems {
    List<DropdownMenuItem<String>> yearItems = [
      const DropdownMenuItem(value: "1993", child: Text("1993")),
      const DropdownMenuItem(value: "1994", child: Text("1994")),
      const DropdownMenuItem(value: "1995", child: Text("1995")),
      const DropdownMenuItem(value: "1996", child: Text("1996")),
      const DropdownMenuItem(value: "1997", child: Text("1997")),
      const DropdownMenuItem(value: "1998", child: Text("1998")),
      const DropdownMenuItem(value: "1999", child: Text("1999")),
      const DropdownMenuItem(value: "2000", child: Text("2000")),
    ];
    return yearItems;
  }

  List<DropdownMenuItem<String>> get genderItems {
    List<DropdownMenuItem<String>> gItems = [
      const DropdownMenuItem(
        value: "male",
        child: Text("Male"),
      ),
      const DropdownMenuItem(value: "female", child: Text("Female")),
    ];
    return gItems;
  }

  List<DropdownMenuItem<String>> get hobbyItems {
    List<DropdownMenuItem<String>> hbyItems = [
      const DropdownMenuItem(
        value: "coding",
        child: Text("Coding"),
      ),
      const DropdownMenuItem(value: "travelling", child: Text("Travelling")),
      const DropdownMenuItem(
          value: "mountain biking", child: Text("Mountain Biking")),
      const DropdownMenuItem(value: "photography", child: Text("Photography")),
      const DropdownMenuItem(value: "cooking", child: Text("Cooking")),
      const DropdownMenuItem(value: "dance", child: Text("Dance")),
    ];
    return hbyItems;
  }

  set setYear(String val) {
    _yselectedValue = val;
  }

  set setHobby1(String val) {
    _yHobby1Value = val;
  }

  set setHobby2(String val) {
    _yHobby2Value = val;
  }

  set setHobby3(String val) {
    _yHobby3Value = val;
  }

  set setGender(String val) {
    _gSelectedValue = val;
  }

  set setImage1(var val) {
    _image1 = val;
  }

  set setImage2(var val) {
    _image2 = val;
  }

  void getValues() {
    // print(regNameController.text);
    // print(getGenderValue);
    // print(getYearValue);
    // print(image1);
    print(gethobby1Value);
    print(gethobby2Value);
    print(gethobby3Value);
  }
}
