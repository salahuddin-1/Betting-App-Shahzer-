import 'package:flutter/material.dart';

import 'body_of_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyOfLogIn(),
    );
  }
}
