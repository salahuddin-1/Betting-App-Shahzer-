import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/Widgets/common_button.dart';

import 'parlay.dart';

class BodyOfPlaceBets extends StatelessWidget {
  final bool isParlay;

  const BodyOfPlaceBets({Key key, this.isParlay = false}) : super(key: key);

  Column isParleyScreen() {
    return Column(
      children: [
        isParlay ? Parlay() : Container(),
        isParlay
            ? SizedBox(
                height: 20,
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 50),
      children: [
        Center(
          child: Card(
            child: Container(
              height: isParlay ? 370 : 230,
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "BET SLIP",
                      textScaleFactor: 1.1,
                    ),
                    margin: EdgeInsets.only(top: 10, left: 10),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isParleyScreen(),
                  bets("Total stack", "0.00 ", "WRG", "(\$ 0.00 USD)"),
                  bets("Total potential returns", "0.00 ", "WRG",
                      "(\$ 0.00 USD)"),
                  Center(
                    heightFactor: 1.5,
                    child: Container(
                      width: Device.width * 0.5,
                      child: CommonButton(
                        title: "LOGIN T0 Place Bets",
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bets(String text, String betAmt, String type, String betInDollars) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  text: betAmt,
                  children: [
                    TextSpan(
                      text: type,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(betInDollars),
            ],
          ),
        ],
      ),
    );
  }
}
