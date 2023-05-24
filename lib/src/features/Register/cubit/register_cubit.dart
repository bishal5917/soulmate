import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/features/Register/register_model.dart';
import 'package:soulmate/src/features/Register/widgets/cubit/choose_hobbies_cubit.dart';
import 'package:soulmate/src/features/auth/Repository/auth_repository.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> registerForm1Key = GlobalKey<FormState>();
  GlobalKey<FormState> registerForm2Key = GlobalKey<FormState>();

  final TextEditingController _regNameController = TextEditingController();
  final TextEditingController _regEmailController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();
  final TextEditingController _regPhoneController = TextEditingController();
  final TextEditingController _regBirthYearController = TextEditingController();
  final TextEditingController _regGenderController = TextEditingController();

  String _gSelectedValue = "male";

  TextEditingController get regNameController => _regNameController;
  TextEditingController get regEmailController => _regEmailController;
  TextEditingController get regPasswordController => _regPasswordController;
  TextEditingController get regPhoneController => _regPhoneController;
  TextEditingController get regBirthYearController => _regBirthYearController;
  TextEditingController get regGenderController => _regGenderController;

  String get getGenderValue => _gSelectedValue;

  List<DropdownMenuItem<String>> get genderItems {
    List<DropdownMenuItem<String>> gItems = [
      const DropdownMenuItem(
        value: "male",
        child: Text("Male"),
      ),
      const DropdownMenuItem(
        value: "female",
        child: Text("Female"),
      ),
    ];
    return gItems;
  }

  set setGender(String val) {
    _gSelectedValue = val;
  }

  Future<void> userRegister() async {
    RegisterModel regModel = RegisterModel(
      name: regNameController.text,
      email: regEmailController.text,
      phone: regPhoneController.text,
      birthYear: regBirthYearController.text,
      gender: getGenderValue,
      hobbies: sl.get<ChooseHobbiesCubit>().selectedInterests,
      password: regPasswordController.text,
      image:
          "https://media.istockphoto.com/id/532237983/photo/unrecognizable-person.jpg?s=612x612&w=0&k=20&c=JcJYir0QZNExJHlF2MYjsjoYSyQhY1IiR5wrHYmNN_w=",
    );
    if (state.status == RegisterStatus.registerStarting) return;
    if (registerForm2Key.currentState!.validate()) {
      emit(state.copyWith(
          status: RegisterStatus.registerStarting,
          message: " Registration Starting"));
      try {
        final userId = await AuthRepository().userRegister(regModel);
        AppSharedPreferences.setUserId(userId);

        emit(state.copyWith(
            status: RegisterStatus.registerSuccess,
            message: "SuccessFully Registered !!! "));
      } catch (err) {
        emit(state.copyWith(
            status: RegisterStatus.error, message: err.toString()));
      }
    } else {
      emit(state.copyWith(
          status: RegisterStatus.dataError,
          message: " Error : Please Enter all details to register !"));
    }
  }

  Future<void> imageUpload() async {
    emit(state.copyWith(
        status: RegisterStatus.imageUploadStarting, message: "Upload Started"));
    try {
      final response = await AuthRepository().imageUpload();
      emit(state.copyWith(
          status: RegisterStatus.imageUploadSuccess,
          message: "Upload Success"));
    } catch (err) {
      emit(state.copyWith(
          status: RegisterStatus.error, message: err.toString()));
    }
  }

  // @override
  void reset() {
    regNameController.clear();
    regEmailController.clear();
    regPhoneController.clear();
    regBirthYearController.clear();
  }
}
