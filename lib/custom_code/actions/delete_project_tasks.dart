// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteProjectTasks(DocumentReference? itemRef) async {
  // Add your function code here!
  print(itemRef);
  final instance = FirebaseFirestore.instance;
  final batch = instance.batch();

  var collection = instance.collection('allTasks');

  //var snapshots = await collection.get();

  var snapshots = await collection
      .where("projectRef", isEqualTo: itemRef)
      .get(); // here you will delete all tasks, beware!!!
// or var snapshots = await collection.where(PUT_YOUR_FILTER).get();

  for (var doc in snapshots.docs) {
    print(doc);
    //print(doc.projectRef);
    batch.delete(doc.reference);
  }
  await batch.commit();
  //return snapshots.data.length;
  return 1;
}
