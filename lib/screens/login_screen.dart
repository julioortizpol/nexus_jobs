import 'package:flutter/material.dart';
import 'package:nexus_jobs/utilities/literals.dart';
import 'package:nexus_jobs/utilities/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';
import '../components/custom_rounded_button.dart';
import '../components/social_acces.dart';
import '../services/services.dart';
import '../utilities/common_functions.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  final logoRoute = 'images/logo.png';
  final _formKey = GlobalKey<FormState>();
  final userTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('accessToken');
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: grayAppColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset(logoRoute, height: 200, width: 200),
            ), //Logo
            Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: customBoxDecoration(10.0, Colors.white),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userLiterals,
                          style: txtFieldLabels,
                        ),
                        SizedBox(height: 2),
                        TextFormField(
                          style: txtFieldContent,
                          cursorColor: txtFieldContentColor,
                          decoration: loginInputDecoration,
                          controller: userTextFieldController,
                          validator: (value) {
                            return emptyFieldValidationFunction(value);
                          },
                        ),
                        SizedBox(height: 15),
                        Text(
                          passwordLiterals,
                          style: txtFieldLabels,
                        ),
                        SizedBox(height: 2),
                        TextFormField(
                          validator: (value) {
                            return emptyFieldValidationFunction(value);
                          },
                          obscureText: true,
                          style: txtFieldContent,
                          cursorColor: txtFieldContentColor,
                          decoration: loginInputDecoration,
                          controller: passwordTextFieldController,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FlatButton(
                    child: Text(
                      forgotPasswordLiterals,
                      style: forgotPassWordButton,
                    ),
                    onPressed: () async {},
                  ),
                ),
              ),
            ]),
            Column(children: [
              CustomRoundedButton(
                action: () async {
                  if (_formKey.currentState.validate()) {
                    await login(
                        User(
                            username: userTextFieldController.text,
                            password: passwordTextFieldController.text),
                        context);
                  }
                },
                color: mainColor,
                text: signInLiterals,
              ),
              CustomRoundedButton(
                action: () => Navigator.pushNamed(context, RegisterScreen.id),
                color: darkBlue,
                text: registerLiterals,
              ),
            ]),
            SocialAccess(darkBlue)
          ],
        ),
      ),
    );
  }
}
