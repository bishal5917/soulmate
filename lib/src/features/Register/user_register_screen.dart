import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/texts.dart';
import 'package:soulmate/src/core/routing/route_navigation.dart';
import 'package:soulmate/src/features/AddImage/Widgets/add_image.dart';
import 'package:soulmate/src/features/AddImage/add_image_screen.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
import 'package:soulmate/src/features/Register/widgets/choose_hobbies_screen.dart';
import 'package:soulmate/src/features/auth/login/login_screen.dart';
import 'package:soulmate/src/utils/String_modify.dart';
import 'package:soulmate/src/utils/custom_toasts.dart';
import 'package:soulmate/src/utils/validation.dart';
import 'package:soulmate/src/widgets/custom_button.dart';
import 'package:soulmate/src/widgets/custom_home_appbar.dart';
import 'package:soulmate/src/widgets/custom_text.dart';
import 'package:soulmate/src/widgets/custom_text_form_field_widget.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final customerTitle = "Enter Your Details";
  final _showPasss = ValueNotifier<bool>(false);
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.dataError) {
          CustomToasts.showToast(
              msg: stringModify().formatErrorMsg(state.message.toString()));
        }
        if (state.status == RegisterStatus.registerSuccess) {
          CustomToasts.showToast(
              msg: state.message.toString(), color: Colors.teal);
          navigate(context, AddImage(false));
        }
        if (state.status == RegisterStatus.error) {
          CustomToasts.showToast(msg: state.message.toString());
        }
        sl.get<RegisterCubit>().reset();
      },
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(appWidth(context), 60),
              child: CustomMainAppBar(
                title: customerTitle,
                bgColor: Colors.white,
              ),
            ),
            body: Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(primary: OColors.kPrimaryMainColor),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stepper(
                      controlsBuilder: (context, controller) {
                        return const SizedBox.shrink();
                      },
                      type: stepperType,
                      elevation: 0.0,
                      physics: const ScrollPhysics(),
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued,
                      onStepCancel: cancel,
                      steps: <Step>[
                        Step(
                          title: const Text('Basics'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Form(
                                key: sl.get<RegisterCubit>().registerForm1Key,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextFormField(
                                      hintText: "Enter Your Name ",
                                      labelText: "Full Name *",
                                      controller: sl
                                          .get<RegisterCubit>()
                                          .regNameController,
                                      validator: (val) =>
                                          val.toString().isEmptyData()
                                              ? emptyText
                                              : val.toString().isNameLength()
                                                  ? nameLength
                                                  : null,
                                    ),
                                    vSizedBox2,
                                    CustomTextFormField(
                                      hintText: "Enter Your Email",
                                      labelText: "Email *",
                                      controller: sl
                                          .get<RegisterCubit>()
                                          .regEmailController,
                                      validator: (val) =>
                                          val.toString().isEmptyData()
                                              ? emptyText
                                              : !val.toString().isValidEmail()
                                                  ? validEmailText
                                                  : null,
                                    ),
                                    vSizedBox2,
                                    CustomTextFormField(
                                      hintText: "Enter Your Phone Number",
                                      labelText: "Phone Number *",
                                      controller: sl
                                          .get<RegisterCubit>()
                                          .regPhoneController,
                                      validator: (val) => val
                                              .toString()
                                              .isPhoneNumberLength()
                                          ? phoneLength
                                          : val.toString().isEmptyData()
                                              ? emptyText
                                              : !val
                                                      .toString()
                                                      .isValidPhoneNumber()
                                                  ? phoneNumberValidateText
                                                  : !val
                                                          .toString()
                                                          .isValidPhoneNumber()
                                                      ? phoneNumberValidateText
                                                      : null,
                                      textInputType: TextInputType.number,
                                    ),
                                    vSizedBox2,
                                    CustomTextFormField(
                                      hintText: "Enter Your Birth Year",
                                      labelText: "Birth Year *",
                                      controller: sl
                                          .get<RegisterCubit>()
                                          .regBirthYearController,
                                      validator: (val) =>
                                          val.toString().isYearLength()
                                              ? invalidBirthYear
                                              : val.toString().isEmptyData()
                                                  ? emptyText
                                                  : !val.toString().isOverAged()
                                                      ? overAgedText
                                                      : !val
                                                              .toString()
                                                              .isunderAged()
                                                          ? underAgedText
                                                          : null,
                                      textInputType: TextInputType.number,
                                    ),
                                    vSizedBox2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        hSizedBox0,
                                        CustomText.ourText("Gender",
                                            fontSize: 17),
                                        hSizedBox3,
                                        DropdownButton(
                                            value: sl
                                                .get<RegisterCubit>()
                                                .getGenderValue,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                sl
                                                        .get<RegisterCubit>()
                                                        .setGender =
                                                    newValue as String;
                                              });
                                            },
                                            items: sl
                                                .get<RegisterCubit>()
                                                .genderItems),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              vSizedBox2,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  hSizedBox3,
                                  CustomText.ourText("Hobbies", fontSize: 17),
                                  hSizedBox3,
                                  DropdownButton(
                                      value: sl
                                          .get<RegisterCubit>()
                                          .gethobby1Value,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          sl.get<RegisterCubit>().setHobby1 =
                                              newValue as String;
                                        });
                                      },
                                      items:
                                          sl.get<RegisterCubit>().hobbyItems),
                                ],
                              ),
                              vSizedBox2,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  hSizedBox4,
                                  DropdownButton(
                                      value: sl
                                          .get<RegisterCubit>()
                                          .gethobby2Value,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          sl.get<RegisterCubit>().setHobby2 =
                                              newValue as String;
                                        });
                                      },
                                      items:
                                          sl.get<RegisterCubit>().hobbyItems),
                                ],
                              ),
                              vSizedBox2,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  hSizedBox4,
                                  DropdownButton(
                                      value: sl
                                          .get<RegisterCubit>()
                                          .gethobby3Value,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          sl.get<RegisterCubit>().setHobby3 =
                                              newValue as String;
                                        });
                                      },
                                      items:
                                          sl.get<RegisterCubit>().hobbyItems),
                                ],
                              ),
                              vSizedBox1,
                              CustomButton.elevatedButton(
                                "Next",
                                () => {continued()},
                                borderRadius: 10,
                                color: OColors.kPrimaryMainColor,
                                fontSize: 17,
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 0
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: const Text('Interests'),
                          content: Column(
                            children: [
                              ChooseHobbiesScreen(),
                              vSizedBox1,
                              CustomButton.elevatedButton(
                                "Next",
                                () => {continued()},
                                borderRadius: 10,
                                color: OColors.kPrimaryMainColor,
                                fontSize: 17,
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 1,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: const Text('Security'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Form(
                                key: sl.get<RegisterCubit>().registerForm2Key,
                                child: Column(
                                  children: <Widget>[
                                    vSizedBox2andHalf,
                                    ValueListenableBuilder<bool>(
                                      builder: (BuildContext context,
                                          bool isTrue, Widget? child) {
                                        return CustomTextFormField(
                                          hintText: "Enter Your Password",
                                          labelText: "Password*",
                                          controller: sl
                                              .get<RegisterCubit>()
                                              .regPasswordController,
                                          validator: (val) =>
                                              val.toString().isEmptyData()
                                                  ? emptyText
                                                  : val
                                                          .toString()
                                                          .isPasswordLength()
                                                      ? passwordLengthText
                                                      : null,
                                          obscureText:
                                              _showPasss.value ? false : true,
                                          suffix: GestureDetector(
                                            onTap: () {
                                              _showPasss.value == true
                                                  ? _showPasss.value = false
                                                  : _showPasss.value = true;
                                            },
                                            child: _showPasss.value
                                                ? const Icon(
                                                    Icons.visibility,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                  ),
                                          ),
                                        );
                                      },
                                      valueListenable: _showPasss,
                                    ),
                                    vSizedBox2,
                                    ValueListenableBuilder<bool>(
                                      builder: (BuildContext context,
                                          bool isTrue, Widget? child) {
                                        return CustomTextFormField(
                                          hintText: "Re-type your password",
                                          labelText: "Confirm Password*",
                                          obscureText:
                                              _showPasss.value ? false : true,
                                          validator: (val) => val
                                                  .toString()
                                                  .isEmptyData()
                                              ? emptyText
                                              : val
                                                      .toString()
                                                      .isPasswordLength()
                                                  ? passwordLengthText
                                                  : val.toString().isSamePassword(sl
                                                          .get<RegisterCubit>()
                                                          .regPasswordController
                                                          .text)
                                                      ? passwordNotMatchedText
                                                      : null,
                                          suffix: GestureDetector(
                                            onTap: () {
                                              _showPasss.value == true
                                                  ? _showPasss.value = false
                                                  : _showPasss.value = true;
                                            },
                                            child: _showPasss.value
                                                ? const Icon(
                                                    Icons.visibility,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                  ),
                                          ),
                                        );
                                      },
                                      valueListenable: _showPasss,
                                    ),
                                  ],
                                ),
                              ),
                              vSizedBox2,
                              state.status == RegisterStatus.registerStarting
                                  ? const CircularProgressIndicator()
                                  : CustomButton.elevatedButton(
                                      "Continue",
                                      () => {
                                            sl
                                                .get<RegisterCubit>()
                                                .userRegister()
                                          },
                                      borderRadius: 10,
                                      color: OColors.kPrimaryMainColor,
                                      fontSize: 17),
                            ],
                          ),
                          isActive: _currentStep >= 2,
                          state: _currentStep >= 2
                              ? StepState.complete
                              : StepState.indexed,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
