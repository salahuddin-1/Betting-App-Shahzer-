import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../GetX/getx_state_management.dart';
import '../../Widgets/text_button.dart';

class LoginForgetPassword extends StatelessWidget {
  final _getXSttCtrl = Get.put(GetXStateManagement());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              GetBuilder<GetXStateManagement>(
                init: GetXStateManagement(),
                builder: (_) => Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  value: _getXSttCtrl.rememberMe,
                  onChanged: (val) {
                    _getXSttCtrl.setRememberMe(!_getXSttCtrl.rememberMe);
                  },
                ),
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.purple[50],
                ),
              ),
            ],
          ),
        ),
        CommonTextButton(
          title: "Forget password??",
          onPressed: () {},
          textStyle: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
