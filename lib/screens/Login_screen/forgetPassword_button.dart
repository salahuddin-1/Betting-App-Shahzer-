import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:news_app/Widgets/text_button.dart';

class LoginForgetPassword extends StatelessWidget {
=======
import 'package:get/get.dart';
import 'package:news_app/GetX/getx_state_management.dart';
import 'package:news_app/Widgets/text_button.dart';

class LoginForgetPassword extends StatelessWidget {
  final _getXSttCtrl = Get.put(GetXStateManagement());
>>>>>>> 2892b94 (Second commit)
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
<<<<<<< HEAD
              Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.black,
                value: true,
                onChanged: (val) {
                  print('Checkbox clicked');
                },
=======
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
>>>>>>> 2892b94 (Second commit)
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
