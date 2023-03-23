// import this Package in pubspec.yaml file
// dependencies:
//
//   animations: ^1.0.0+5

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenContainer(
          closedBuilder: (_, openContainer) {
            return Container(
              height: 200,
              width: 200,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: openContainer,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            );
          },
          openColor: Colors.white,
          closedElevation: 50.0,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          closedColor: Colors.white,
          openBuilder: (_, closeContainer) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Go back'),
                leading: IconButton(
                  onPressed: closeContainer,
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
