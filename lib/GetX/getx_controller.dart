import 'package:get/get.dart';
import 'package:news_app/screens/Registration/password_strength.dart';

class MyGetXController extends GetxController {
  StrengthOfPassword _passwordStrength;

  StrengthOfPassword get passwordStrength => _passwordStrength;

  void setPasswordStrength(StrengthOfPassword strengthOfPassword) {
    if (strengthOfPassword == StrengthOfPassword.Strong) {
      _passwordStrength = StrengthOfPassword.Strong;
      update();
    } else if (strengthOfPassword == StrengthOfPassword.Average) {
      _passwordStrength = StrengthOfPassword.Average;
      update();
    } else {
      _passwordStrength = StrengthOfPassword.Poor;
      update();
    }
  }
}
