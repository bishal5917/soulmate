import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulmate/di_injection.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/core/app/texts.dart';
import 'package:soulmate/src/features/Register/Widgets/add_image.dart';
import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';
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
  final _showPass = ValueNotifier<bool>(false);
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
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
              .copyWith(primary: OColors.kPrimaryDarkColor),
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
                    title: const Text('Basic Info'),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: <Widget>[
                            vSizedBox2andHalf,
                            CustomTextFormField(
                              hintText: "Enter Your Name ",
                              labelText: "Full Name *",
                              controller:
                                  sl.get<RegisterCubit>().regNameController,
                              validator: (val) => val.toString().isEmptyData()
                                  ? emptyText
                                  : val.toString().isNameLength()
                                      ? nameLength
                                      : null,
                            ),
                            vSizedBox2,
                            CustomTextFormField(
                              hintText: "Enter Your Email",
                              labelText: "Email *",
                              controller:
                                  sl.get<RegisterCubit>().regEmailController,
                              validator: (val) => val.toString().isEmptyData()
                                  ? emptyText
                                  : !val.toString().isValidEmail()
                                      ? validEmailText
                                      : null,
                            ),
                            vSizedBox2,
                            CustomTextFormField(
                              hintText: "Enter Your Phone Number",
                              labelText: "Phone Number *",
                              controller:
                                  sl.get<RegisterCubit>().regPhoneController,
                              validator: (val) => val.toString().isEmptyData()
                                  ? emptyText
                                  : val.toString().isValidPhoneNumber()
                                      ? phoneNumberValidateText
                                      : null,
                            ),
                            vSizedBox2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                hSizedBox0,
                                CustomText.ourText("Birth Year", fontSize: 17),
                                hSizedBox3,
                                DropdownButton(
                                    value: sl.get<RegisterCubit>().getYearValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sl.get<RegisterCubit>().setYear =
                                            newValue as String;
                                      });
                                    },
                                    items: sl.get<RegisterCubit>().yearItems),
                              ],
                            ),
                            vSizedBox2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                hSizedBox0,
                                CustomText.ourText("Gender", fontSize: 17),
                                hSizedBox3,
                                DropdownButton(
                                    value:
                                        sl.get<RegisterCubit>().getGenderValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sl.get<RegisterCubit>().setGender =
                                            newValue as String;
                                      });
                                    },
                                    items: sl.get<RegisterCubit>().genderItems),
                              ],
                            )
                          ],
                        ),
                        vSizedBox2,
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
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Add Pics'),
                    content: Column(
                      children: [
                        const AddImage(),
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
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Security'),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: <Widget>[
                            vSizedBox2andHalf,
                            ValueListenableBuilder<bool>(
                              builder: (BuildContext context, bool isTrue,
                                  Widget? child) {
                                return CustomTextFormField(
                                  hintText: "Enter Your Password",
                                  labelText: "Password*",
                                  controller: sl
                                      .get<RegisterCubit>()
                                      .regPasswordController,
                                  validator: (val) =>
                                      val.toString().isEmptyData()
                                          ? emptyText
                                          : val.toString().isPasswordLength()
                                              ? passwordLengthText
                                              : null,
                                  obscureText: _showPass.value ? false : true,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      _showPass.value == true
                                          ? _showPass.value = false
                                          : _showPass.value = true;
                                    },
                                    child: _showPass.value
                                        ? const Icon(
                                            Icons.visibility,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                          ),
                                  ),
                                );
                              },
                              valueListenable: _showPass,
                            ),
                            vSizedBox2,
                            ValueListenableBuilder<bool>(
                              builder: (BuildContext context, bool isTrue,
                                  Widget? child) {
                                return CustomTextFormField(
                                  hintText: "Re-type your password",
                                  labelText: "Confirm Password*",
                                  obscureText: _showPass.value ? false : true,
                                  validator: (val) =>
                                      val.toString().isEmptyData()
                                          ? emptyText
                                          : val.toString().isPasswordLength()
                                              ? passwordLengthText
                                              : val.toString().isSamePassword(sl
                                                      .get<RegisterCubit>()
                                                      .regPasswordController
                                                      .text)
                                                  ? passwordNotMatchedText
                                                  : null,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      _showPass.value == true
                                          ? _showPass.value = false
                                          : _showPass.value = true;
                                    },
                                    child: _showPass.value
                                        ? const Icon(
                                            Icons.visibility,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                          ),
                                  ),
                                );
                              },
                              valueListenable: _showPass,
                            ),
                          ],
                        ),
                        vSizedBox2,
                        CustomButton.elevatedButton("Continue",
                            () => {sl.get<RegisterCubit>().getValues()},
                            borderRadius: 10,
                            color: OColors.kPrimaryMainColor,
                            fontSize: 17),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  )
                ],
              ),
            ),
          ],
        ),
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
