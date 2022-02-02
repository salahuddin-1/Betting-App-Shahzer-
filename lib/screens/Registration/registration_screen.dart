import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/getx_passDataConstant.dart';
import '../../GetX/getx_controller.dart';
import '../../GetX/getx_loading_controller.dart';
import '../../Packages/check_password_strength.dart';
import '../../Services/get_users.dart';
import '../../Services/register.dart';
import '../../Widgets/circular_progress_indicator.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/dialogs.dart';
import '../../Widgets/header.dart';
import '../../Widgets/show_toast.dart';
import '../../Widgets/text_field.dart';
import '../../model/registerAUserObj.dart';
import '../Login_screen/login_screen.dart';
import '../Login_screen/switch_login_registration.dart';
import 'set_password_textfield.dart';

import 'password_strength.dart';

class RegistrationScreen extends StatelessWidget {
  final lightPurple = Colors.purple[50];
  final _emailCntrlr = new TextEditingController();
  final _usernameCntrlr = new TextEditingController();
  final _passCntrlr = new TextEditingController();
  final _cfPassCntrlr = new TextEditingController();
  final _getXC = Get.put(MyGetXController());
  final _getLoadCtrl = Get.put(GetxLoadingController());
  final password = new PassWord();
  final _formKey = GlobalKey<FormState>();

  void onChangedPassword(String value) {
    if (password.isStrong(value)) {
      _getXC.setPasswordStrength(StrengthOfPassword.Strong);
    } else if (password.isAverage(value)) {
      _getXC.setPasswordStrength(StrengthOfPassword.Average);
    } else {
      _getXC.setPasswordStrength(StrengthOfPassword.Poor);
    }
  }

  void registerUser(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _getLoadCtrl.setProgressForButton(true);
      var userP = new UserParameters(
        email: _emailCntrlr.text,
        username: _usernameCntrlr.text,
        password: _passCntrlr.text,
      );

      await GetUsers.getRegisteredUser(_emailCntrlr.text.trim()).then(
        (doc) async {
          if (doc.exists) {
            ShowToast.toast(context, "User already registered");
          } else {
            await GetUsers.getSameUsername(_usernameCntrlr.text).then(
              (snapshot) async {
                if (snapshot.docs.isNotEmpty) {
                  ShowToast.toast(context, "Username already taken");
                } else {
                  await RegisterAUser.register(userP).then(
                    (value) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                      ShowToast.toast(context, "Success");
                    },
                  ).catchError(
                    (err) {
                      _getLoadCtrl.setProgressForButton(false);
                      DialogBox.infoDialog(context, err.toString());
                      print(err.toString());
                    },
                  );
                }
              },
            );
          }
        },
      );
      _getLoadCtrl.setProgressForButton(false);
    }
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
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            TextFormField(
                              validator: (val) {
                                if (val.contains(" ")) {
                                  return "Email cannot contain empty space";
                                } else if (!val.isEmail) {
                                  return "Enter a valid email";
                                }

                                return null;
                              },
                              controller: _emailCntrlr,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "  Email Address",
                              ),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val.length > 15) {
                                  return "Username too long";
                                } else if (val.length == 0) {
                                  return "Username must not be empty";
                                } else if (val.length < 4) {
                                  return "Username too short";
                                }
                                return null;
                              },
                              controller: _usernameCntrlr,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "  Pick a username",
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Password must not be empty";
                                } else if (val.length > 15) {
                                  return "Only 15 characters allowed";
                                } else if (_getXC.passwordStrength ==
                                    StrengthOfPassword.Poor) {
                                  return "Password is poor";
                                }
                                return null;
                              },
                              controller: _passCntrlr,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "  Password",
                              ),
                              onFieldSubmitted: (val) {
                                GetXPassDataConstant.getxPassData
                                    .setPassword(_passCntrlr.text);
                              },
                              onChanged: (val) {
                                onChangedPassword(
                                  _passCntrlr.text,
                                );
                              },
                            ),
                            PasswordStrength(),
                            TextFormField(
                              validator: (val) {
                                if (val != _passCntrlr.text.trim()) {
                                  return "Passwords don't match";
                                }

                                return null;
                              },
                              controller: _cfPassCntrlr,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "  Confirm Password",
                              ),
                            ),
                            GetBuilder<GetxLoadingController>(
                              init: GetxLoadingController(),
                              builder: (_) => CommonButton(
                                wantWidget: _.showProgressForButton,
                                widget: MyCircularProgress.progress(),
                                title: "Create Account",
                                onPressed: () {
                                  registerUser(context);
                                },
                              ),
                            ),
                            SwitchLoginRegistration(
                              text: "Already have an account?",
                              buttonTitle: "Log in instead",
                              screen: LoginScreen(),
                            ),
                            Divider(
                              color: lightPurple,
                            ),
                            Text(
                              "By creating an account you are agreeing to Betalweek Terms of Use and Privacy Policy and to be updated about Betalweek products, news, and promotions. Users must be 18+ to play Fantasy and 21+ to play Sportsbook",
                              style: TextStyle(
                                color: lightPurple,
                              ),
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
      ),
    );
  }
}
