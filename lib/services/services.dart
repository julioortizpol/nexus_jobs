import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/job.dart';
import '../Models/user.dart';

Future<void> _showMyDialog(List messages, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: SingleChildScrollView(
          child: Container(
            height: 100,
            width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${messages[index]}'),
                );
              },
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

addStringToSF(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

getStringValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(key);
  return stringValue;
}

createUser(User user, context) async {
  String url =
      'http://newnexusvacantsapp-env.eba-ismjscyn.us-east-2.elasticbeanstalk.com/auth/signup';
  Response response = await httpPostUser(user, url);

  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    return "User Created";
  } else {
    _showMyDialog(jsonDecode(response.body)['message'], context);
  }
}

login(User user, context) async {
  String url =
      'http://newnexusvacantsapp-env.eba-ismjscyn.us-east-2.elasticbeanstalk.com/auth/signin';
  Response response = await httpPostUser(user, url);
  if (response.statusCode == 201) {
    addStringToSF('accessToken', jsonDecode(response.body)['accessToken']);
    return true;
    //return "User Loged";
  } else {
    _showMyDialog(jsonDecode(response.body)['message'], context);
    return false;
    //return jsonDecode(response.body)['message'];
  }
}

Future<Response> httpPostUser(User user, String url) {
  return post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'fullName': user.fullName,
      'email': user.email,
      'username': user.username,
      'password': user.password,
      'gender': user.gender,
    }),
  );
}

Future fetchJobs() async {
  final response = await get(
      'http://newnexusvacantsapp-env.eba-ismjscyn.us-east-2.elasticbeanstalk.com/jobs',
      headers: <String, String>{
        'Authorization': "Bearer ${await getStringValuesSF('accessToken')}",
      });
  if (response.statusCode == 200) {
    return (jsonDecode(response.body));
  } else {
    return null;
  }
}

getJobsList(context) async {
  dynamic jobsList = await fetchJobs();
  if (jobsList != null) {
    return List.generate(
        jobsList.length, (index) => Job.fromJson(jobsList[index]));
  } else {
    _showMyDialog(["Error Al obtener la data"], context);
    Navigator.pop(context);
    //Context is kill after dialog
  }
}
