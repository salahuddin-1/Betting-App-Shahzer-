import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'AppThemeData/apps_theme.dart';
import 'HomePage/homepage.dart';
import 'Web_Integration/webview_homepage.dart';

void main() {
  initialiseFirebase();
  runApp(MyApp());
}

void initialiseFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetAllWeek',
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        inputDecorationTheme: AppsThemeData.textFieldData(),
        textTheme: AppsThemeData.textData(),
      ),
      home: WebViewHomepage(),
    );
  }
}
