import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'AppThemeData/apps_theme.dart';
import 'Constants/device_parameters.dart';
import 'HomePage/homepage.dart';

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
<<<<<<< HEAD
    
=======
>>>>>>> 2892b94 (Second commit)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        inputDecorationTheme: AppsThemeData.textFieldData(),
        textTheme: AppsThemeData.textData(),
      ),
      home: HomePage(),
    );
  }
}
