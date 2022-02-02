import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/getx_passDataConstant.dart';
import '../../GetX/getx_controller.dart';
import '../../Packages/check_password_strength.dart';
import '../../Widgets/text_field.dart';
import 'password_strength.dart';

class SetPasswordTextField extends StatelessWidget {
  final _textEditingController = new TextEditingController();
  final _getXC = Get.put(MyGetXController());
  final password = new PassWord();

  void onChangedPassword(String value) {
    if (password.isStrong(value)) {
      _getXC.setPasswordStrength(StrengthOfPassword.Strong);
    } else if (password.isAverage(value)) {
      _getXC.setPasswordStrength(StrengthOfPassword.Average);
    } else {
      _getXC.setPasswordStrength(StrengthOfPassword.Poor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: "  Password",
      onChanged: () {
        onChangedPassword(_textEditingController.text);
      },
      onFieldSubmitted: () {
        GetXPassDataConstant.getxPassData
            .setPassword(_textEditingController.text);
      },
      textEditingController: _textEditingController,
    );
  }
}
