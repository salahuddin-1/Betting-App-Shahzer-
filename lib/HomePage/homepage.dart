import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/screens/LiveMatches/live_matches_screen.dart';
import 'package:news_app/screens/login_screen/login_screen.dart';

import 'homepage_layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool exitTheApp = false;

  @override
  Widget build(BuildContext context) {
    Device.setDeviceHeightWidth(context);
    return WillPopScope(
      onWillPop: () async {
        confirmExitTheApp(context);
        return false;
      },
      child: HomePageLayout(),
    );
  }

  Future confirmExitTheApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exit the application ?"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  exitTheApp = true;
                });
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
