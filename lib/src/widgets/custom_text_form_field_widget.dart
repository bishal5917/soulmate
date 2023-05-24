import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app/colors.dart';
import '../core/configs/regex_config.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  TextInputType textInputType;
  String? labelText;
  Widget? suffix;
  bool? isEnabled;
  bool readOnly;
  bool obscureText;
  final Function? validator;
  bool onlyText;
  bool onlyNumber;
  int? maxLine;
  int? minLine;
  int? maxLength;
  bool? prefixText;
  bool? filled;
  Color? fillColor;
  IconData? prefixIcon;
  Function()? onTap;
  Function? onChanged;
  Function? onFieldSubmitted;
  String? initialValue;
  bool? isFromSearch;
  bool? autoFocus;
  AutovalidateMode? autovalidateMode;
  List<String> autoFillHint;
  bool searchString;
  bool fullNameString;
  TextInputAction? textInputAction;
  double borderRadius;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.labelText,
    this.suffix,
    this.isEnabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.onlyText = false,
    this.onlyNumber = false,
    this.maxLine = 1,
    this.minLine = 1,
    this.maxLength,
    this.prefixText,
    this.filled = false,
    this.fillColor = const Color(0xffF4F4F4),
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.initialValue,
    this.isFromSearch = false,
    this.autoFocus = false,
    this.autovalidateMode,
    this.autoFillHint = const [],
    this.searchString = false,
    this.fullNameString = false,
    this.textInputAction,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLine,
      maxLines: maxLine,
      maxLength: maxLength,
      textInputAction: textInputAction,
      autofillHints: autoFillHint,
      autofocus: autoFocus ?? false,
      validator: (value) {
        return validator == null ? null : validator!(value);
      },
      style: TextStyle(
        color: readOnly ? Colors.grey : null,
        fontSize: 16,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),

      inputFormatters: onlyNumber
          ? [
              FilteringTextInputFormatter.allow(RegexConfig.numberRegex),
            ]
          : onlyText
              ? [
                  FilteringTextInputFormatter.allow(RegexConfig.textRegex),
                ]
              : searchString
                  ? [
                      FilteringTextInputFormatter.allow(
                          RegexConfig.searchRegrex)
                    ]
                  : fullNameString
                      ? [
                          FilteringTextInputFormatter.allow(
                              RegexConfig.fullNameTextRegrex)
                        ]
                      : [],
      readOnly: readOnly,
      initialValue: initialValue,
      enabled: isEnabled,
      onTap: onTap,
      onChanged: (val) => isFromSearch == true ? onChanged!(val) : null,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      // onFieldSubmitted: (val) =>
      //     isFromSearch == true ? onFieldSubmitted!(val) : null,
      decoration: InputDecoration(
        // prefixText: prefixText == true ? "$phoneNumberPrefixText " : null,
        filled: filled,
        labelStyle: TextStyle(
          fontFamily: "Inter",
          color: OColors.kNeutral500Color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(
          fontSize: 10.0,
          fontFamily: "Inter",
        ),
        hintStyle: TextStyle(
          fontFamily: "Inter",
          // fontSize: 16.0,
          color: OColors.kNeutral500Color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.grey,
              )
            : null,
        fillColor: filled == true ? fillColor : null,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffix,
        enabledBorder: filled == true
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: OColors.kTextFormFieldBorderColor,
                ),
              ),
        border: filled == true
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: OColors.kTextFormFieldBorderColor,
                ),
              ),
        focusedBorder: filled == true
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: OColors.kTextFormFieldBorderColor,
                ),
              ),
      ),
    );
  }
}
