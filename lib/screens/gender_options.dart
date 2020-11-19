import 'package:flutter/material.dart';
import 'package:nexus_jobs/utilities/styles.dart';

class SexOptionsScreen extends StatelessWidget {
  static String id = "SexOptionsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          "Seleccione",
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, top: 30),
              child: FlatButton(
                  onPressed: () => Navigator.pop(context, "M"),
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Masculino",
                        style: txtFieldContent,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  color: grayAppColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(7.0))),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, top: 20),
              child: FlatButton(
                  onPressed: () => Navigator.pop(context, "F"),
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Famenino",
                        style: txtFieldContent,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  color: grayAppColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(7.0))),
            ),
          ],
        ),
      ),
    );
  }
}
