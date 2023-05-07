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
  String _yselectedValue = "1993";
  String _gSelectedValue = "male";

  TextEditingController get regNameController => _regNameController;
  TextEditingController get regEmailController => _regEmailController;
  TextEditingController get regPasswordController => _regPasswordController;
  TextEditingController get regPhoneController => _regPhoneController;
  TextEditingController get regBirthYearController => _regBirthYearController;
  TextEditingController get regGenderController => _regGenderController;
  String get getYearValue => _yselectedValue;
  String get getGenderValue => _gSelectedValue;

  List<DropdownMenuItem<String>> get yearItems {
    List<DropdownMenuItem<String>> yearItems = [
      const DropdownMenuItem(child: Text("1993"), value: "1993"),
      const DropdownMenuItem(child: Text("1994"), value: "1994"),
      const DropdownMenuItem(child: Text("1995"), value: "1995"),
      const DropdownMenuItem(child: Text("1996"), value: "1996"),
      const DropdownMenuItem(child: Text("1997"), value: "1997"),
      const DropdownMenuItem(child: Text("1998"), value: "1998"),
      const DropdownMenuItem(child: Text("1999"), value: "1999"),
      const DropdownMenuItem(child: Text("2000"), value: "2000"),
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

  set setYear(String val) {
    _yselectedValue = val;
  }

  set setGender(String val) {
    _gSelectedValue = val;
  }

  void getValues() {
    print(regNameController.text);
    print(getGenderValue);
    print(getYearValue);
  }
}
