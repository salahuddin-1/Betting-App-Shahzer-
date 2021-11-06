import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/GetX/getx_loading_controller.dart';
import 'package:news_app/GetX/getx_state_management.dart';
import 'package:news_app/HomePage/homepage.dart';
import 'package:news_app/HomePage/homepage_layout.dart';
import 'package:news_app/Services/database.dart';
import 'package:news_app/Services/get_users.dart';
import 'package:news_app/Services/sign_in.dart';
import 'package:news_app/Widgets/circular_progress_indicator.dart';
import 'package:news_app/Widgets/common_button.dart';
import 'package:news_app/Widgets/dialogs.dart';
import 'package:news_app/Widgets/header.dart';
import 'package:news_app/Widgets/show_toast.dart';
import 'package:news_app/Widgets/text_field.dart';
import 'package:news_app/model/user_model.dart';
import 'package:news_app/screens/Login_screen/switch_login_registration.dart';
import 'package:news_app/screens/Registration/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgetPassword_button.dart';

class BodyOfLogIn extends StatelessWidget {
  final lightPurple = Colors.purple[50];

  final _emailCntrlr = new TextEditingController();
  final _passCntrlr = new TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  final _getLoadCtrl = Get.put(GetxLoadingController());
  static final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _passKey =
      GlobalKey<FormFieldState<String>>();

  void signIn(context) {
    SignInActions(
      context: context,
      email: _emailCntrlr.text.trim(),
      password: _passCntrlr.text.trim(),
      getLoadCtrl: _getLoadCtrl,
      formKey: _formKey,
    ).signIn();
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
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
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
                            TextFormField(
                              key: _emailKey,
                              validator: (val) {
                                if (val.contains(" ")) {
                                  return "Email cannot contain space";
                                } else if (!val.contains(RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                                  return "Email is not valid";
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
                              key: _passKey,
                              obscureText: true,
                              validator: (val) {
                                if (val.isEmpty)
                                  return "Password must not be empty";

                                return null;
                              },
                              controller: _passCntrlr,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "  Password",
                              ),
                            ),
                            LoginForgetPassword(),
                            GetBuilder<GetxLoadingController>(
                              init: GetxLoadingController(),
                              builder: (_) {
                                return CommonButton(
                                  wantWidget:
                                      _getLoadCtrl.showProgressForButton,
                                  widget: MyCircularProgress.progress(),
                                  title: "LOGIN",
                                  onPressed: () => signIn(context),
                                );
                              },
                            ),
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
      ),
    );
  }
}

class SignInActions {
  final GlobalKey<FormState> formKey;
  final String email;
  final String password;
  final BuildContext context;
  final GetxLoadingController getLoadCtrl;

  SignInActions({
    @required this.formKey,
    @required this.email,
    @required this.password,
    @required this.context,
    @required this.getLoadCtrl,
  });

  final getStMngmnt = Get.put(GetXStateManagement());

  void signIn() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      getLoadCtrl.setProgressForButton(true);
      await GetUsers.getRegisteredUser(email).then(
        (doc) async {
          if (!doc.exists) {
            DialogBox.infoDialog(context, "You are not registered");
            return;
          }
          var userModel = UserModel.fromJson(doc);

          if (userModel.email == email && userModel.password == password) {
            ShowToast.toast(context, "Signed-In successfully");
            final prefs = await SharedPreferences.getInstance();

            if (getStMngmnt.rememberMe) {
              prefs.setString("email", email);
              prefs.setString("password", password);
              print("Prefs set");
            }

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageLayout(),
              ),
              (route) => false,
            );
            return;
          }
          ShowToast.toast(context, "Incorrect details");
          return;
        },
      ).catchError(
        (err) {
          getLoadCtrl.setProgressForButton(false);
          DialogBox.infoDialog(
            context,
            err.toString(),
          );
          print(err.toString());
        },
      );
      getLoadCtrl.setProgressForButton(false);
    }
  }
}
