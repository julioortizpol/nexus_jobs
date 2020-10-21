import 'package:flutter/material.dart';
import 'package:nexus_jobs/utilities/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_jobs/utilities/literals.dart';

class LoginScreen extends StatelessWidget {
  final logoRoute = 'images/logo.png';
  final gIconRoue = "images/Google.svg";
  final fbIconRoute = "images/FB.svg";
  final linkedinIconRoute = "images/Linkedin.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: grayBackGround,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userLiterals,
                        style: txtFieldLabels,
                      ),
                      SizedBox(height: 2),
                      TextField(
                          style: txtFieldContent,
                          cursorColor: txtFieldContentColor,
                          decoration: loginInputDecoration),
                      SizedBox(height: 15),
                      Text(
                        passwordLiterals,
                        style: txtFieldLabels,
                      ),
                      SizedBox(height: 2),
                      TextField(
                          style: txtFieldContent,
                          cursorColor: txtFieldContentColor,
                          decoration: loginInputDecoration)
                    ],
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
                    onPressed: () {},
                  ),
                ),
              ),
            ]),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: FlatButton(
                    onPressed: () {},
                    child: Container(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                            child: Text(
                          signInLiterals,
                          style: loginButtonLabel,
                        ))),
                    color: mainColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0))),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: FlatButton(
                    onPressed: () {},
                    child: Container(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                            child: Text(
                          registerLiterals,
                          style: TextStyle(
                              color: Color(0xffFCFCFC),
                              fontFamily: 'NotoSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))),
                    color: darkBlue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0))),
              ),
            ]),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: darkGray,
                        height: 2,
                        width: 72,
                      ),
                      Text(
                        signInWith,
                        style: TextStyle(
                            color: darkBlue,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Container(
                        color: darkGray,
                        height: 2,
                        width: 72,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        height: 42,
                        width: 42,
                        child: SvgPicture.asset(
                          gIconRoue,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        height: 42,
                        width: 42,
                        child: SvgPicture.asset(
                          fbIconRoute,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        height: 42,
                        width: 42,
                        child: SvgPicture.asset(
                          linkedinIconRoute,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
