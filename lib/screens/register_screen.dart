import 'package:flutter/material.dart';
import 'package:nexus_jobs/Models/user.dart';
import 'package:nexus_jobs/utilities/literals.dart';
import 'package:nexus_jobs/utilities/styles.dart';

import './gender_options.dart';
import '../Models/user.dart';
import '../components/custom_rounded_button.dart';
import '../components/custom_rounded_text_field.dart';
import '../components/social_acces.dart';
import '../services/services.dart';
import '../utilities/common_functions.dart';
import 'gender_options.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameTextFieldController = TextEditingController();

  final emailTextFieldController = TextEditingController();

  final userTextFieldController = TextEditingController();

  final passwordTextFieldController = TextEditingController();

  String secOption = "Sexo";

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SexOptionsScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    setState(() {
      secOption = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          registerScreenLiterals,
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(
        builder: (context) => Container(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomRoundedTextField(
                            customTxtFieldController: nameTextFieldController,
                            hintText: "Nombre y apellido",
                            customValidation: (value) {
                              return emptyFieldValidationFunction(value);
                            },
                          ),
                          CustomRoundedTextField(
                            customTxtFieldController: emailTextFieldController,
                            hintText: "Correo electronico",
                            customValidation: (value) {
                              if (!validateEmail(value)) {
                                return "Correo invalido";
                              }
                              return emptyFieldValidationFunction(value);
                            },
                          ),
                          CustomRoundedTextField(
                            customTxtFieldController: userTextFieldController,
                            hintText: "Usuario",
                            customValidation: (value) {
                              return emptyFieldValidationFunction(value);
                            },
                          ),
                          CustomRoundedTextField(
                            isPassword: true,
                            customTxtFieldController:
                                passwordTextFieldController,
                            hintText: "Contraseña",
                            customValidation: (value) {
                              return emptyFieldValidationFunction(value);
                            },
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 16, left: 16, top: 20),
                            child: FlatButton(
                                onPressed: () {
                                  _navigateAndDisplaySelection(context);
                                },
                                child: Container(
                                    width: double.infinity,
                                    height: 46,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            secOption,
                                            style: txtFieldContent,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: txtFieldContentColor,
                                        )
                                      ],
                                    )),
                                color: grayAppColor,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(7.0))),
                          ),
                        ],
                      ),
                    ),
                    CustomRoundedButton(
                      color: darkBlue,
                      text: registerLiterals,
                      action: () async {
                        if (_formKey.currentState.validate()) {
                          var response = await createUser(
                              User(
                                fullName: nameTextFieldController.text,
                                username: userTextFieldController.text,
                                password: passwordTextFieldController.text,
                                email: emailTextFieldController.text,
                                gender: secOption,
                              ),
                              context);
                          if (!(response is List)) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text(response)));
                          }
                        }
                      },
                    ),
                    SocialAccess(Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
