import 'package:flutter/material.dart';
import '../../../Constants/device_parameters.dart';

import 'more_wages.dart';
import 'sports_name.dart';
import 'team.dart';

class MatchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          card(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      // margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 20),
      child: Text(
        "Live Matches",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget card() {
    return Container(
      // color: Colors.green,
      // padding: EdgeInsets.only(bottom: 30),
      width: Device.width,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            // color: Colors.yellow,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 120,
                  width: 300,
                  child: Column(
                    children: [
                      SportsName(
                        title: "Chinese Basketball",
                      ),
                      Team(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        // offset: Offset(0.01, 0.01),
                        spreadRadius: 0.1,
                        blurRadius: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 60,
                  right: 5,
                  child: MoreWagers(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
