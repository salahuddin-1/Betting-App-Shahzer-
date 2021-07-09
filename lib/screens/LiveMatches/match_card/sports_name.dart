import 'package:flutter/material.dart';

class SportsName extends StatelessWidget {
  final String title;

  const SportsName({Key key, this.title}) : super(key: key);

  final black = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sports_soccer,
                color: black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3,
                  vertical: 1,
                ),
                child: Text(
                  "Live",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Half Time",
                style: TextStyle(
                  fontSize: 12,
                  color: black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
