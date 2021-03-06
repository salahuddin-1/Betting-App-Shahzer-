import 'package:flutter/material.dart';

import '../../Constants/device_parameters.dart';
import '../../Widgets/header.dart';
import 'header.dart';
import 'sports_tile.dart';

class BodyOfDifferentSports extends StatelessWidget {
  final List<SportsData> items = [
    SportsData(Icons.sports_basketball, "Basketball"),
    SportsData(Icons.sports_soccer, "Football"),
    SportsData(Icons.sports_hockey, "Ice Hockey"),
    SportsData(Icons.sports_baseball, "Baseball"),
    SportsData(Icons.sports_tennis, "Tennis"),
    SportsData(Icons.sports_football, "Rugby Union"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device.height,
      width: Device.width,
      child: ListView(
        padding: EdgeInsets.only(top: 60),
        children: [
          Header(
            color: Colors.purple[900],
            // isLoginRegistration: false,
          ),
          SizedBox(height: 60),
          HeaderDifferentSports(),
          for (int i = 0; i < items.length; i++)
            SportsTile(
              icon: items[i].icon,
              sportsName: items[i].sportsName,
            ),
        ],
      ),
    );
  }
}

class SportsData {
  IconData icon;
  String sportsName;

  SportsData(IconData icon, String sportsName) {
    this.icon = icon;
    this.sportsName = sportsName;
  }
}
