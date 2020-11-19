import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../Models/job.dart';

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

emptyFieldValidationFunction(value) {
  if (value.isEmpty) {
    return "Campo obligatorio";
  }

  return null;
}

filterJobsByDepartment(jobsList) {
  Map<String, List<Job>> filterList = new Map();
  jobsList.forEach((jobPosition) {
    if (!filterList.containsKey(jobPosition.department)) {
      filterList[jobPosition.department] = new List();
    }
    filterList[jobPosition.department].add(jobPosition);
  });
  return filterList;
}

filterJobsByName(jobsList) {
  jobsList = List.from(jobsList);

  jobsList.sort((dynamic jobA, dynamic jobB) {
    if (jobA.name.compareTo(jobB.name) == -1) {
      return -1;
    } else if (jobA.name.compareTo(jobB.name) == 0) {
      return 0;
    } else {
      return 1;
    }
  });
  Map<String, List<Job>> filterList = new Map();
  jobsList.forEach((jobPosition) {
    if (!filterList.containsKey(jobPosition.name[0])) {
      filterList[jobPosition.name[0]] = new List();
    }
    filterList[jobPosition.name[0]].add(jobPosition);
  });
  return filterList;
}

filterJobsByDate(jobsList) {
  List jobObjectsList = List.from(jobsList);
  jobObjectsList.sort((a, b) {
    int numberOfDaysOfPublishedJobA =
        getNumberOfDaysOfPublishedJob(a.creationDate);
    int numberOfDaysOfPublishedJobB =
        getNumberOfDaysOfPublishedJob(b.creationDate);
    return numberOfDaysOfPublishedJobA.compareTo(numberOfDaysOfPublishedJobB);
  });
  return jobObjectsList;
}

getNumberOfDaysOfPublishedJob(date) {
  if (date != null) {
    return DateTime.now().difference(date).inDays;
  } else {
    return 0;
  }
}

getJobIcon(String department) {
  Map<String, IconData> icon = {
    "Tecnologia": Icons.alternate_email,
    "Marketing": Icons.details,
    "Contabilidad": Icons.business
  };
  if (icon.containsKey(department)) {
    return icon[department];
  } else {
    return Icons.work;
  }
}

onShare(BuildContext context, Job job) async {
  final RenderBox box = context.findRenderObject();

  if (job != null) {
    await Share.share(
        "${job.name}\n${job.longDescription}\nj.ortiz@nexus.com.do",
        subject: "Vacante Nexus",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
