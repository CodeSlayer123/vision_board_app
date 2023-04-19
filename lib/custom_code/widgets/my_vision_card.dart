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

class MyVisionCard extends StatefulWidget {
  const MyVisionCard({
    Key? key,
    this.width,
    this.height,
    this.image,
    this.title,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? image;
  final String? title;

  @override
  _MyVisionCardState createState() => _MyVisionCardState();
}

class _MyVisionCardState extends State<MyVisionCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        //height: widget.height,
        width: widget.width,
        child: Card(
          child: Image.network(
            widget.image ?? 'image.png',
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(5),
        ),
      ),

      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-olnum5/assets/zougn4be1dnq/thumbtack_1a.png',
                width: 50)
          ])),

      //Spacer(),
/*
      Row(
          //height: double.infinity,
          //width: widget.width,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
              ),
            ),
          ]),
          */
/*
      Container(
        //height: double.infinity,
        width: widget.width,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [
                  0.0,
                  5.0
                ])),
      ),
      */

      Padding(
          padding: EdgeInsets.only(
              bottom: 20, left: 50), //apply padding to some sides only
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title ?? 'Error',
                  style: TextStyle(
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                    height: 100, decoration: BoxDecoration(color: Colors.blue))
              ]))
    ]);

    /*
return Container(
      height: 250,
      child: Card(
        child: Image.network(
          widget.image ?? 'image.png',
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );

    */
  }
}
