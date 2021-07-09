import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/Services/sign_in.dart';
import 'package:news_app/Widgets/common_button.dart';
import 'package:news_app/Widgets/header.dart';
import 'package:news_app/Widgets/text_field.dart';
import 'package:news_app/model/user_model.dart';
import 'package:news_app/screens/Login_screen/switch_login_registration.dart';
import 'package:news_app/screens/Registration/registration_screen.dart';

import 'forgetPassword_button.dart';

class BodyOfLogIn extends StatelessWidget {
  final lightPurple = Colors.purple[50];

  final _emailCntrlr = new TextEditingController();
  final _passCntrlr = new TextEditingController();

  void signIn() async {
    await SignIn.signIN(_emailCntrlr.text).then((doc) {
      var userModel = UserModel.fromJson(doc);

      if (userModel.email == _emailCntrlr.text &&
          userModel.password == _passCntrlr.text) {
        print("signIn");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        childOfStack1(),
        childOfStack2(),
      ],
    );
  }

  Widget childOfStack1() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/image1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget childOfStack2() {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus();
      },
      child: BlurryContainer(
        borderRadius: BorderRadius.only(),
        blur: 2,
        bgColor: Colors.purple[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 35,
          ),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Container(
                child: ListView(
                  children: [
                    Container(
                      height: orientation == Orientation.portrait
                          ? Device.height * .8
                          : Device.width * .8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Header(),
                          Text("Log In to Betallweek"),
                          CommonTextField(hintText: "  Email Address"),
                          CommonTextField(hintText: "  Password"),
                          LoginForgetPassword(),
                          CommonButton(title: "LOGIN", onPressed: () {
                            signIn();
                          },),
                          SwitchLoginRegistration(
                            text: "Don't have an account?",
                            buttonTitle: "Sign Up",
                            screen: RegistrationScreen(),
                          ),
                          Divider(color: lightPurple),
                          Text(
                            "If you or someone youknow has a problem and wants help, call 8898911744",
                            style: TextStyle(color: lightPurple),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
