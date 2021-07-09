import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Constants/getx_passDataConstant.dart';
import 'package:news_app/GetX/getx_controller.dart';
import 'package:news_app/Packages/check_password_strength.dart';
import 'package:news_app/Services/register.dart';
import 'package:news_app/Widgets/common_button.dart';
import 'package:news_app/Widgets/header.dart';
import 'package:news_app/Widgets/text_field.dart';
import 'package:news_app/model/registerAUserObj.dart';
import 'package:news_app/screens/Login_screen/login_screen.dart';
import 'package:news_app/screens/Login_screen/switch_login_registration.dart';
import 'package:news_app/screens/Registration/set_password_textfield.dart';

import 'password_strength.dart';

class RegistrationScreen extends StatelessWidget {
  final lightPurple = Colors.purple[50];

  final _emailCntrlr = new TextEditingController();
  final _usernameCntrlr = new TextEditingController();
  final _passCntrlr = new TextEditingController();
  final _cfPassCntrlr = new TextEditingController();

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

  void registerUser() {
    var userP = new UserParameters(
      email: _emailCntrlr.text,
      username: _usernameCntrlr.text,
      password: _passCntrlr.text,
    );
    RegisterAUser.register(userP).then((value) {
      print("Success");
    }).catchError((err) {
      print(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          childOfStack1(),
          childOfStack2(),
        ],
      ),
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
                          ? MediaQuery.of(context).size.height * .8
                          : MediaQuery.of(context).size.width * .8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Header(),
                          Text("Create a Betallweek Account"),
                          CommonTextField(
                            hintText: "  Email Address",
                            textEditingController: _emailCntrlr,
                          ),
                          CommonTextField(
                            hintText: "  Pick a username",
                            textEditingController: _usernameCntrlr,
                          ),
                          CommonTextField(
                            hintText: "  Password",
                            onChanged: () {
                              onChangedPassword(_passCntrlr.text);
                            },
                            onFieldSubmitted: () {
                              GetXPassDataConstant.getxPassData
                                  .setPassword(_passCntrlr.text);
                            },
                            textEditingController: _passCntrlr,
                          ),
                          PasswordStrength(),
                          CommonTextField(
                            hintText: "  Confirm Password",
                            textEditingController: _cfPassCntrlr,
                          ),
                          CommonButton(title: "Create Account", onPressed: () {
                            registerUser();
                          },),
                          SwitchLoginRegistration(
                            text: "Already have an account?",
                            buttonTitle: "Log in instead",
                            screen: LoginScreen(),
                          ),
                          Divider(
                            color: lightPurple,
                          ),
                          Text(
                            "By creating an account you are agreeing to Fan Duel Terms of USe and Privacy Policy and to be updated about FanDuel Group products, news, and promotions. Users must be 18+ to play Fantasy and 21+ to play Sportsbook",
                            style: TextStyle(color: lightPurple),
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
