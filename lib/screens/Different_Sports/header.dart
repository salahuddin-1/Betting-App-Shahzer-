import 'package:flutter/material.dart';

class HeaderDifferentSports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "Upcoming",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
