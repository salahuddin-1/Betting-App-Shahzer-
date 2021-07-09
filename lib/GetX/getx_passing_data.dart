import 'package:get/get.dart';

class MyGetXPassingData extends GetxController {
  String _email;

  String get email => _email;

  void setEmail(String email) {
    _email = email;
    update();
  }

  String _password;

  String get password => _password;

  void setPassword(String password) {
    _password = password;
    update();
  }

  String _username;

  String get username => _username;

  void setUsername(String username) {
    _username = username;
    update();
  }
}
