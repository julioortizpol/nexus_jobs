import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_jobs/components/custom_bottom_navegation_bar.dart';
import 'package:nexus_jobs/utilities/literals.dart';
import 'package:nexus_jobs/utilities/styles.dart';

import '../Models/job.dart';
import '../components/jobs_card_component.dart';
import '../components/jobs_list_segment.dart';
import '../screens/job_details_screen.dart';
import '../services/services.dart';
import '../utilities/common_functions.dart';
import '../utilities/styles.dart';

class JobsListScreen extends StatefulWidget {
  static String id = "JobsListScreen";

  @override
  _JobsListScreenState createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {
  int counter = 0;
  int _selectedIndexBottomNavigationBar = 1;
  int _selectedIndexTapBars = 2;
  dynamic futureJobsList;
  dynamic jobsList;
  dynamic filterJobList;
  String jobListSvgIconRoute = "images/Iconos_Lista.svg";

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndexBottomNavigationBar = index;
    });
  }

  searchJobsFilter(String value) {
    List searchFilter = jobsList.where((job) {
      bool state = job.name.contains(value);
      return state;
    }).toList();
    jobFilters(_selectedIndexTapBars, searchFilter);
  }

  void navigateToDetails(Job selectedJob) {
    int selectedIndex = jobsList.indexOf(selectedJob);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JobsDetailsScreen(
                  jobList: jobsList,
                  startIndex: selectedIndex,
                )));
  }

  jobFilters(index, jobsList) {
    switch (index) {
      case 0:
        {
          filterJobList = filterJobsByName(jobsList);
        }
        break;
      case 1:
        {
          filterJobList = filterJobsByDate(jobsList);
        }
        break;
      default:
        {
          filterJobList = filterJobsByDepartment(jobsList);
        }
        break;
    }
    setState(() {
      filterJobList;
    });
  }

  initialJobPresentation(data) {
    if (filterJobList == null) {
      filterJobList = filterJobsByDepartment(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureJobsList = getJobsList(context);
  }

  Widget customTap({String tapName}) {
    return Tab(
      child: Text(
        tapName,
        style: tapsTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grayAppColor,
        body: FutureBuilder(
          future: futureJobsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              jobsList = snapshot.data;
              initialJobPresentation(snapshot.data);
              return DefaultTabController(
                // The number of tabs / content sections to display.
                length: 3,
                initialIndex: 2,
                child: Scaffold(
                  backgroundColor: grayAppColor,
                  appBar: PreferredSize(
                    child: Container(
                      color: mainColor,
                      padding: EdgeInsets.only(
                          top: 50, right: 35, left: 35, bottom: 10),
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        style: TextStyle(
                            color: txtFieldContentColor,
                            fontSize: 20,
                            fontFamily: "Nunito-SemiBold",
                            height: 1.3),
                        cursorColor: txtFieldContentColor,
                        onChanged: (value) {
                          searchJobsFilter(value);
                        },
                        decoration: InputDecoration(
                            prefixIcon: Container(
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 5, left: 2),
                              height: 16,
                              width: 22,
                              child: SvgPicture.asset(
                                jobListSvgIconRoute,
                                color: secondaryColor,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            focusedBorder: customOutLineBorderInputRegister,
                            border: customOutLineBorderInputRegister,
                            filled: true,
                            hintStyle: txtFieldJobFilter,
                            hintText: searchJobLiterals,
                            fillColor: grayAppColor,
                            contentPadding: EdgeInsets.symmetric(vertical: 0)),
                      ),
                    ),
                    preferredSize: Size.fromHeight(70.0),
                  ),
                  body: Column(
                    children: [
                      Material(
                        color: Colors.white,
                        child: TabBar(
                          onTap: (index) {
                            if (_selectedIndexTapBars != index) {
                              jobFilters(index, jobsList);
                              _selectedIndexTapBars = index;
                            }
                          },
                          indicator: BoxDecoration(color: secondaryColor),
                          unselectedLabelColor: secondaryColor,
                          tabs: [
                            customTap(
                              tapName: jobOrderTapsLiterals['byAlphabet'],
                            ),
                            customTap(
                              tapName: jobOrderTapsLiterals['byDate'],
                            ),
                            customTap(
                              tapName: jobOrderTapsLiterals['byDepartment'],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: grayAppColor,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: filterJobList.length,
                            itemBuilder: (context, index) {
                              return (_selectedIndexTapBars != 1)
                                  ? JobsListSegment(
                                      department:
                                          filterJobList.keys.elementAt(index),
                                      navigateToDetails: navigateToDetails,
                                      jobsList: filterJobList[
                                          filterJobList.keys.elementAt(index)],
                                    )
                                  : JobCardComponent(
                                      job: filterJobList[index],
                                      navigateToDetails: navigateToDetails,
                                    );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: CustomBottomNavigationBar(
                    selectedIndexBottomNavigationBar:
                        _selectedIndexBottomNavigationBar,
                    onBottomNavigationBarItemTapped:
                        _onBottomNavigationBarItemTapped,
                  ),
                ), // Complete this code in the next step.
              );
            } else if (snapshot.hasError) {
              Navigator.pop(context);
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
