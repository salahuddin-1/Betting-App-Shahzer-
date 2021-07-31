import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
<<<<<<< HEAD
import 'package:news_app/screens/LiveMatches/live_matches_screen.dart';
import 'package:news_app/screens/login_screen/login_screen.dart';

=======
import 'package:news_app/Widgets/show_toast.dart';
import 'package:news_app/screens/LiveMatches/live_matches_screen.dart';
import 'package:news_app/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'initial_screen.dart';
>>>>>>> 2892b94 (Second commit)
import 'homepage_layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool exitTheApp = false;
<<<<<<< HEAD

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
=======
  bool isLoggedIn = true;

  void getPref() async {
    await SharedPreferences.getInstance().then(
      (prefs) {
        if (prefs.containsKey("email") && prefs.containsKey("password")) {
          print(prefs.getString("email"));
          print(prefs.getString("password"));
          return;
        }

        setState(() {
          isLoggedIn = false;
        });
      },
    ).catchError(
      (err) {
        ShowToast.toast(context, err.toString());
      },
    );
  }

  removePref() async {
    await SharedPreferences.getInstance().then((pref) {
      pref.clear().then((value) {
        print("CLEARED");
      });
    });
  }

  @override
  void initState() {
    // removePref();
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Device.setDeviceHeightWidth(context);
    return isLoggedIn ? HomePageLayout() : InitialScreen();
>>>>>>> 2892b94 (Second commit)
  }
}
