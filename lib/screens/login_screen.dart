import 'package:flutter/material.dart';
import 'package:nexus_jobs/utilities/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: grayBackGround,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset(
                'images/logo.png',
                height: 200,
                width: 200,
              ),
            ), //Logo
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Usuario",
                      style: TextStyle(),
                    ),
                    TextField(),
                    Text("Contraseña"),
                    TextField()
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  child: Text(
                    "¿Olvidó su contraseña?",
                    style: TextStyle(color: Color(0xff133463)),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: FlatButton(
                  onPressed: () {},
                  child: Container(
                      width: double.infinity,
                      height: 48,
                      child: Center(
                          child: Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Color(0xffFCFCFC)),
                      ))),
                  color: Color(0xff483EE8),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0))),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: FlatButton(
                  onPressed: () {},
                  child: Container(
                      width: double.infinity,
                      height: 48,
                      child: Center(
                          child: Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Color(0xffFCFCFC)),
                      ))),
                  color: Color(0xff483EE8),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0))),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: 72,
                      ),
                      Text("Iniciar sesión con"),
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: 72,
                      ),
                    ],
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
                        child: SvgPicture.asset("images/Google.svg"),
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
                        child: SvgPicture.asset("images/FB.svg"),
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
                          "images/Linkedin.svg",
                          height: 29,
                          width: 29,
                          fit: BoxFit.contain,
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
