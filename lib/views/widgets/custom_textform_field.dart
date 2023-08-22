// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  FocusNode? focusNode;
  Widget? prefixIcon;
  double? prefixPaddingVerticle;
  double? prefixPaddingHorizontal;
  bool? isPasswordField;
  bool? validateEmail;
  double? contentPaddingHorizontal;
  double? contentPaddingVertical;
  bool obscureText;
  VoidCallback? onPressed;
  final String validationText;
  TextInputType? keyboardtype;
  final String hintText;
  TextEditingController? controller;

  CustomTextFormField(
      {super.key,
      required this.validationText,
      this.keyboardtype,
      this.validateEmail,
      this.onPressed,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      required this.obscureText,
      this.prefixPaddingHorizontal,
      this.prefixPaddingVerticle,
      required this.hintText,
      this.focusNode,
      this.controller,
      this.isPasswordField,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationText;
        }
        if (isPasswordField == true && value.length < 6) {
          return password_length_string;
        }
        final emailRegExp = RegExp(
            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
        if (validateEmail == true && !emailRegExp.hasMatch(value)) {
          return invalid_email;
        }

        return null;
      },
      controller: controller,
      maxLines: 1,
      obscureText: obscureText,
      keyboardType: keyboardtype,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: isPasswordField == true
            ? Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: IconButton(
                  icon: Icon(obscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: onPressed,
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: form_hint_style,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(small_radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary_color),
          borderRadius: BorderRadius.circular(small_radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: border_color),
          borderRadius: BorderRadius.circular(small_radius),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: contentPaddingVertical ?? 0,
            horizontal: contentPaddingHorizontal ?? 0),
      ),
    );
  }
}
