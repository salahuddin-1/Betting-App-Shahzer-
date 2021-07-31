import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/Widgets/common_button.dart';
import 'package:news_app/Widgets/header.dart';
import 'package:news_app/screens/Login_screen/login_screen.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Device.height,
        width: Device.width,
        child: Stack(
          children: [
            Container(
              height: Device.height,
              width: Device.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/image3.jpg",
                  ),
                ),
              ),
            ),
            BlurryContainer(
              bgColor: Colors.purple[900],
              blur: 2,
              child: Container(),
              borderRadius: BorderRadius.only(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome to",
                      textScaleFactor: 1.1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Header(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                      "Place bets and trade with crypto currency. The betting application desinged just for you. Betting hyys juyst dhyf ijuhy tsyhjf hytgdt fgtdft rfsrdf tdgtfs rdfdu dtfdt"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: CommonButton(
                    title: "Login / Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
