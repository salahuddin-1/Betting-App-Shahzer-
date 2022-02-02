import 'package:get/get.dart';

class GetXStateManagement extends GetxController {
  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  void setRememberMe(bool value) {
    _rememberMe = value;
    update();
  }
}
