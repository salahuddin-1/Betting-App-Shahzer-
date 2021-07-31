import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/HomePage/initial_screen.dart';
import 'package:news_app/Widgets/common_button.dart';
import 'package:news_app/Widgets/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetingsScreen extends StatelessWidget {
  void onPressed(BuildContext context) async {
    await SharedPreferences.getInstance().then(
      (prefs) {
        prefs.clear().then(
          (isCleared) {
            if (isCleared) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialScreen(),
                ),
                (route) => false,
              );
            }
          },
        ).catchError(
          (err) {
            ShowToast.toast(
              context,
              "Error",
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device.height,
      width: Device.width,
      child: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 100),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.purple[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Default Currency"),
                        Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 20,
                          color: Colors.purple[900],
                        ),
                        Text("Default Currency"),
                        Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 20,
                          color: Colors.purple[900],
                        ),
                        Text("Default Currency"),
                        Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 20,
                          color: Colors.purple[900],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                    child: Text(
                      "Advanced Settings",
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    color: Colors.purple[800],
                    child: Text(
                      "Seed Words",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 70,
              ),
              child: CommonButton(
                title: "Logout",
                onPressed: () {
                  onPressed(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
