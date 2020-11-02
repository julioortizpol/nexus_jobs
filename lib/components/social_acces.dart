import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/styles.dart';
import '../utilities/literals.dart';

class SocialAccess extends StatelessWidget {
  final gIconRoue = "images/Google.svg";
  final fbIconRoute = "images/FB.svg";
  final linkedinIconRoute = "images/Linkedin.svg";

  final Color textColor;

  SocialAccess(this.textColor);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: textColor,
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
    );
  }
}
