import 'package:flutter/material.dart';
import '../utilities/styles.dart';

class CustomRoundedTextField extends StatelessWidget {
  final customTxtFieldController;
  final String hintText;
  final bool isPassword;
  final Function customValidation;

  CustomRoundedTextField(
      {this.customTxtFieldController,
      this.hintText,
      this.isPassword,
      this.customValidation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: TextFormField(
        obscureText: (isPassword == null) ? false : isPassword,
        style: txtFieldContent,
        cursorColor: txtFieldContentColor,
        controller: customTxtFieldController,
        onChanged: (value) {},
        validator: (value) {
          return customValidation(value);
        },
        decoration: InputDecoration(
            focusedBorder: customOutLineBorderInputRegister,
            border: customOutLineBorderInputRegister,
            filled: true,
            hintStyle: TextStyle(color: txtFieldContentColor),
            hintText: hintText,
            fillColor: grayAppColor,
            contentPadding: EdgeInsets.all(12)),
      ),
    );
  }
}
