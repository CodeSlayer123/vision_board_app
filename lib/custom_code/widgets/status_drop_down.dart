// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class StatusDropDown extends StatefulWidget {
  const StatusDropDown({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _StatusDropDownState createState() => _StatusDropDownState();
}

class _StatusDropDownState extends State<StatusDropDown> {
  String dropdownValue = 'Short Term';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: dropdownValue,
        isExpanded: true,
        hint: Text('Select any category', style: TextStyle(fontSize: 15)),
        items: [
          DropdownMenuItem(
              value: 'Sports',
              child: Text('Sports',
                  style: TextStyle(fontSize: 15, color: Colors.blue))),
          DropdownMenuItem(
              value: 'Tech',
              child: Text('Tech',
                  style: TextStyle(fontSize: 15, color: Colors.blue))),
        ],
        onChanged: (val) {
          setState(() {
            dropdownValue = val.toString();
          });
        });
  }
}
