import 'package:flutter/material.dart';

import '../Models/job.dart';
import '../components/jobs_card_component.dart';
import '../utilities/common_functions.dart';
import '../utilities/styles.dart';

class JobsListSegment extends StatelessWidget {
  final String department;
  final List<Job> jobsList;
  final Function navigateToDetails;
  const JobsListSegment(
      {this.department, this.jobsList, @required this.navigateToDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3,
        ),
        Container(
          height: (department.length == 1) ? null : 35,
          color: (department.length == 1) ? Colors.transparent : darkBlue,
          child: Center(
            child: (department.length == 1)
                ? Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      department,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        getJobIcon(department),
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "  ${department.toUpperCase()}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'NotoSans-Bold',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
          ),
        ),
        ListView.builder(
          physics: new NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: jobsList.length,
          itemBuilder: (context, index) {
            return JobCardComponent(
              job: jobsList[index],
              navigateToDetails: navigateToDetails,
              isLastComponent: ((index + 1) == jobsList.length),
            );
          },
        ),
      ],
    );
  }
}
