import 'package:flutter/material.dart';
import 'package:nexus_jobs/utilities/styles.dart';
import 'package:simple_coverflow/simple_coverflow.dart';

import '../components/job_details_component.dart';

class JobsDetailsScreen extends StatelessWidget {
  static String id = "JobsDetailsScreen";
  final jobList;
  final int startIndex;
  int currentIndex;

  getFistIndex() {
    if (currentIndex == null) {
      currentIndex = startIndex;
    }
  }

  JobsDetailsScreen({this.jobList, this.startIndex});

  @override
  Widget build(BuildContext context) {
    getFistIndex();
    double heightContainer = MediaQuery.of(context).size.height * 0.85;
    return Scaffold(
        backgroundColor: Color(0xffEDF1F7).withOpacity(0.85),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: secondaryColor),
                    Text(
                      "BACK",
                      style: TextStyle(color: secondaryColor),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        body: CoverFlow(
            startIndex: startIndex,
            height: heightContainer.toInt(),
            dismissibleItems: false,
            itemCount: jobList.length,
            itemBuilder: widgetBuilder,
            currentItemChangedCallback: (int index) {
              currentIndex = index;
            }));
  }

  Widget widgetBuilder(BuildContext context, int index) {
    if (jobList.length == 0) {
      return new Container(
        child: Text("No data"),
      );
    } else {
      return Container(
        child: JobDetailsComponent(
          job: jobList[index],
          showDisable: (index == currentIndex),
        ),
      );
    }
  }
}
