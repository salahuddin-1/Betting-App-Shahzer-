import 'package:flutter/material.dart';
import '../../Constants/device_parameters.dart';

import 'body_of_placebets.dart';

class Parlay extends StatelessWidget {
  final bodyOfPlaceBets = new BodyOfPlaceBets();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 120,
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bodyOfPlaceBets.bets("25", "", "0.00", "potential return"),
            bodyOfPlaceBets.bets("BETMSX", "0.00 ", "WRG", "(\$ 0.00 USD)"),
          ],
        ),
      ),
    );
  }
}
