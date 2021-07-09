import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';

class SportsCardList extends StatelessWidget {
  final List<CardType> items = [
    CardType(Icons.sports_baseball, "Baseball"),
    CardType(Icons.sports_basketball, "Basketball"),
    CardType(Icons.sports_football, "Football"),
    CardType(Icons.sports_cricket, "Cricket"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Device.width,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return card(index);
        },
      ),
    );
  }

  Widget card(int index) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        width: 70,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              items[index].iconData,
              size: 32,
              color: Colors.purple[900],
            ),
            Text(
              items[index].text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.purple[900],
              ),
            ),
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
    );
  }
}

class CardType {
  IconData iconData;
  String text;

  CardType(IconData iconData, String text) {
    this.iconData = iconData;
    this.text = text;
  }
}
