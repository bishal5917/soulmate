import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> registerForm1Key = GlobalKey<FormState>();
  GlobalKey<FormState> registerForm2Key = GlobalKey<FormState>();
  GlobalKey<FormState> registerForm3Key = GlobalKey<FormState>();
  final TextEditingController _regNameController = TextEditingController();
  final TextEditingController _regEmailController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();
  final TextEditingController _regPhoneController = TextEditingController();
  final TextEditingController _regBirthYearController = TextEditingController();
  final TextEditingController _regGenderController = TextEditingController();

  // final List<XFile> _images = [];
  XFile? _image1;
  XFile? _image2;
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
  XFile? get image1 => _image1;
  XFile? get image2 => _image2;

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

  set setImage1(XFile? val) {
    _image1 = val;
    emit(state.copyWith(status: RegisterStatus.image1Loaded));
  }

  set setImage2(XFile? val) {
    _image2 = val;
    emit(state.copyWith(status: RegisterStatus.image2Loaded));
  }

  void getValues() {
    // print(regNameController.text);
    // print(getGenderValue);
    // print(getYearValue);
    // print(image1);
    // print(gethobby1Value);
    // print(gethobby2Value);
    // print(gethobby3Value);
    // print(images);
  }

  Future<void> userRegister() async {
    // print(image1);
    // print(image2);
    if (state.status == RegisterStatus.registerStarting) return;
    if (registerForm1Key.currentState!.validate() &&
        registerForm2Key.currentState!.validate() &&
        registerForm3Key.currentState!.validate()) {
      emit(state.copyWith(status: RegisterStatus.registerStarting));
      try {
        // final response = await _authRepository.logIn(
        //     email: loginEmailController.text,
        //     password: loginPasswordController.text);
        emit(state.copyWith(
            status: RegisterStatus.registerSuccess,
            message: "SuccessFully Registered"));
      } catch (err) {
        emit(state.copyWith(
            status: RegisterStatus.error, message: err.toString()));
      }
    }
    emit(state.copyWith(
        status: RegisterStatus.dataError,
        message: " Error : Please Enter all details to register !"));
  }
}
