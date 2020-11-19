import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_jobs/utilities/literals.dart';
import 'package:nexus_jobs/utilities/styles.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  final int selectedIndexBottomNavigationBar;
  final Function onBottomNavigationBarItemTapped;

  const CustomBottomNavigationBar(
      {this.selectedIndexBottomNavigationBar,
      this.onBottomNavigationBarItemTapped});
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  String settingSvgIconRoute = "images/Iconos_configuracion.svg";
  String jobListSvgIconRoute = "images/Iconos_Lista.svg";
  String profileSvgIconRoute = "images/Iconos_Perfil.svg";

  customBottomNavigationItem({String svgRoute, String name, int index}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        svgRoute,
        color: Colors.white,
        fit: BoxFit.cover,
        width: 21,
        height: 24,
      ),
      title: Text(
        (widget.selectedIndexBottomNavigationBar == index) ? "" : name,
        style: TextStyle(fontSize: 10, fontFamily: "Nunito-SemiBold"),
      ),
      activeIcon: SelectedBottomBarOption(
        text: name,
        svgIconRoute: svgRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mainColor,
                grayAppColor,
              ],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(0.0, 0.0),
              stops: [0.855, 0.0],
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            items: <BottomNavigationBarItem>[
              customBottomNavigationItem(
                  svgRoute: profileSvgIconRoute,
                  index: 0,
                  name: profileLiterals),
              customBottomNavigationItem(
                  svgRoute: jobListSvgIconRoute,
                  index: 1,
                  name: openingListLiterals),
              customBottomNavigationItem(
                  svgRoute: settingSvgIconRoute,
                  index: 2,
                  name: settingLiterals),
            ],
            currentIndex: widget.selectedIndexBottomNavigationBar,
            selectedItemColor: mainColor,
            unselectedItemColor: grayAppColor,
            onTap: widget.onBottomNavigationBarItemTapped,
          ),
        ),
      ],
    );
  }
}

class SelectedBottomBarOption extends StatelessWidget {
  final String text;
  final String svgIconRoute;
  const SelectedBottomBarOption({this.text, this.svgIconRoute});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 7,
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIconRoute,
              color: mainColor,
              fit: BoxFit.cover,
              width: 24,
              height: 32,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mainColor,
                  fontSize: 10,
                  fontFamily: "Nunito-SemiBold"),
            )
          ],
        ),
      ),
    );
  }
}
