import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

double progressBarValue(
  int? totalNumber,
  int? completedNumber,
  ProjectsRecord project,
  String userRef,
  bool? fromTasks,
) {
  // Sum the number of tasks complete and convert to a 0 - 1.0 scale
  if (totalNumber == null || completedNumber == null || totalNumber == 0) {
    return 0.0;
  }
  final value = completedNumber.toDouble() / totalNumber;
  // if all tasks completed
  if (value == 1.0) {
    //set project completed  field to true
    project.reference.update({'completed': true});

    //if function is being called from task checkbox
    if (fromTasks == true) {
      //increment user's completedProjects field by 1
      FirebaseFirestore.instance
          .collection('users')
          .doc(userRef)
          .update({'completedProjects': FieldValue.increment(1)});
      FirebaseFirestore.instance
          .collection('users')
          .doc(userRef)
          .update({'hasCompletedProjects': true});
    }
    //returns 1 because project has been completed
    return 1.0;
  }
  // if task is unchecked, completed is set back to false
  project.reference.update({'completed': false});

  // if task is unchecked for first time since project is completed, and function is being called from task checkbox

  //if (totalNumber - completedNumber == 1 && fromTasks == true) {
  //decrement user's completedProjects field by 1

  // FirebaseFirestore.instance.collection('users').doc(userRef).update({'completedProjects': FieldValue.increment(-1)});

  //}
  return value;
}

double? tasksLeft(
  int? totalNumber,
  int? completedNumber,
) {
  // Sum the number of tasks complete and convert to a 0 - 1.0 scale
  if (totalNumber == null || completedNumber == null || totalNumber == 0) {
    return 0.0;
  }
  final value = completedNumber.toDouble() / totalNumber;
  if (value == 1.0) {
    return 1.0;
  }
  //projectCompleted = false;
  //print(projectCompleted);
  return value;
}

String? alertFunc() {
  // alert dialogue pop up
  return '''
  AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            //Navigator.of(context).pop();
          },
        ),
      ],
    );
  ''';
}
