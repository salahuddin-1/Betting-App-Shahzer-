import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/GetX/getx_controller.dart';

class PasswordStrength extends StatelessWidget {
  final lightPurple = Colors.purple[100];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGetXController>(
      builder: (getCtrl) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Password strength"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: passwordStrength(getCtrl)),
            ],
          ),
        );
      },
    );
  }

  Widget passwordStrength(MyGetXController getCtrl) {
    if (getCtrl.passwordStrength == StrengthOfPassword.Strong)
      return Text("strong");
    else if (getCtrl.passwordStrength == StrengthOfPassword.Average)
      return Text("average");

    return Text("poor");
  }
}

enum StrengthOfPassword {
  Poor,
  Average,
  Good,
  Strong,
}
