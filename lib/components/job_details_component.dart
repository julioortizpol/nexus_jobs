import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_jobs/utilities/literals.dart';
import 'package:nexus_jobs/utilities/styles.dart';

import '../Models/job.dart';
import '../utilities/common_functions.dart';

class JobDetailsComponent extends StatelessWidget {
  final Job job;
  final bool showDisable;
  List detailsStringList = List();
  final String svgIconRoute = "images/Iconos_compartir.svg";

  JobDetailsComponent({this.job, this.showDisable});

  parseHtmlToStringList() {
    job.details.forEach((text) {
      bool containsListTag = text.contains("<li>");
      bool containsEndListTag = text.contains("</li>");
      if (containsListTag && containsEndListTag) {
        detailsStringList.add(text.substring(4, text.indexOf("</li>")));
      }
    });
    return detailsStringList;
  }

  @override
  Widget build(BuildContext context) {
    parseHtmlToStringList();
    double heightContainer = (MediaQuery.of(context).size.height * 0.85) - 65;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 30),
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  job.name,
                  style: TextStyle(
                      fontFamily: 'Nunito-ExtraBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
                Text(
                  'Hace ${getNumberOfDaysOfPublishedJob(job.creationDate)} dias',
                  style: daysCountTextStyle,
                ),
                Divider(
                  color: grayAppColor,
                  thickness: 1.4,
                ),
                Expanded(
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          jobDescriptionLiterals,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunitoi-SemiBold',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        child: Text(
                          job.longDescription,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      Divider(
                        color: grayAppColor,
                        thickness: 1.4,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          jobDetailsLiterals,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunitoi-SemiBold',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                        itemCount: detailsStringList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              '• ${detailsStringList[index]}',
                              style:
                                  TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onShare(context, job);
                  },
                  child: Container(
                    color: mainColor,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            svgIconRoute,
                            color: Colors.white,
                            fit: BoxFit.cover,
                            width: 24,
                            height: 21,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "COMPARTIR",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height: heightContainer,
            width: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7), topLeft: Radius.circular(7)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Material(
            borderOnForeground: true,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            elevation: 4,
            child: Container(
              child: Icon(
                getJobIcon(job.department),
                size: 45,
              ),
              height: 90,
              width: 90,
            ),
          ),
        ),
        Visibility(
          visible: !showDisable,
          child: Opacity(
            opacity: (showDisable) ? 0.0 : 0.8,
            child: Container(
              color: Color(0xffEDF1F7).withOpacity(0.85),
            ),
          ),
        )
      ],
    );
  }
}
