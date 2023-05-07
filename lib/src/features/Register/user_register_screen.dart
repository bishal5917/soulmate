import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
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

  String selectedValue = "1995";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("1993"), value: "1993"),
      const DropdownMenuItem(child: Text("1994"), value: "1994"),
      const DropdownMenuItem(child: Text("1995"), value: "1995"),
      const DropdownMenuItem(child: Text("1996"), value: "1996"),
      const DropdownMenuItem(child: Text("1997"), value: "1997"),
      const DropdownMenuItem(child: Text("1998"), value: "1998"),
      const DropdownMenuItem(child: Text("1999"), value: "1999"),
      const DropdownMenuItem(child: Text("2000"), value: "2000"),
    ];
    return menuItems;
  }

  String gSelectedValue = "male";
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
                            ),
                            vSizedBox2,
                            CustomTextFormField(
                              hintText: "Enter Your Email",
                              labelText: "Email *",
                            ),
                            vSizedBox2,
                            CustomTextFormField(
                              hintText: "Enter Your Phone Number",
                              labelText: "Phone Number *",
                            ),
                            vSizedBox2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                hSizedBox0,
                                CustomText.ourText("Birth Year", fontSize: 17),
                                hSizedBox3,
                                DropdownButton(
                                    value: selectedValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
                                    },
                                    items: dropdownItems),
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
                                    value: gSelectedValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        gSelectedValue = newValue!;
                                      });
                                    },
                                    items: genderItems),
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
                        CustomButton.elevatedButton("Continue", () => {},
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
    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
