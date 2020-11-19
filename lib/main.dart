import 'package:flutter/material.dart';
import 'package:nexus_jobs/screens/gender_options.dart';

import 'screens/gender_options.dart';
import 'screens/job_details_screen.dart';
import 'screens/jobs_list.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        SexOptionsScreen.id: (context) => SexOptionsScreen(),
        JobsListScreen.id: (context) => JobsListScreen(),
        JobsDetailsScreen.id: (context) => JobsDetailsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
