import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_jobs/utilities/styles.dart';

import '../Models/job.dart';
import '../utilities/common_functions.dart';

class JobCardComponent extends StatelessWidget {
  final Job job;
  final isLastComponent;
  final String svgIconRoute = "images/Iconos_compartir.svg";
  final Function navigateToDetails;

  const JobCardComponent(
      {this.job,
      @required this.navigateToDetails,
      this.isLastComponent = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                navigateToDetails(job);
              },
              child: Container(
                height: 61,
                width: 61,
                child: Icon(
                  getJobIcon(job.department),
                  size: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  navigateToDetails(job);
                },
                child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          job.name,
                          style: TextStyle(
                              fontFamily: 'Nunito-ExtraBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          job.shortDescription,
                          style: TextStyle(
                              fontSize: 12, fontFamily: 'Nunito-Light'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Hace ${getNumberOfDaysOfPublishedJob(job.creationDate)} días",
                          style: daysCountTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 61,
              width: 61,
              child: Row(
                children: [
                  VerticalDivider(
                    thickness: 2,
                    color: secondaryColorWithOpacity,
                  ),
                  GestureDetector(
                    onTap: () {
                      onShare(context, job);
                    },
                    child: SvgPicture.asset(
                      svgIconRoute,
                      color: secondaryColor,
                      fit: BoxFit.cover,
                      width: 24,
                      height: 21,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: 15, left: 15),
          child: (isLastComponent)
              ? SizedBox(
                  height: 6,
                )
              : Divider(
                  thickness: 2,
                  color: secondaryColorWithOpacity,
                ),
        )
      ],
    );
  }
}
