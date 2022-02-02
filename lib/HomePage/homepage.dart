import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/device_parameters.dart';
import '../Widgets/show_toast.dart';
import 'homepage_layout.dart';
import 'initial_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool exitTheApp = false;
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
  }
}
