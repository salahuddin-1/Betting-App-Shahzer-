import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isLoginRegistration;
  final Color color;

  const Header({
    Key key,
    this.isLoginRegistration = true,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.sports_basketball_rounded,
          size: isLoginRegistration ? 65 : 40,
          color: color,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Betallweek",
              style: TextStyle(
                fontFamily: "Tangerine",
                fontSize: isLoginRegistration ? 50 : 35,
                fontStyle: FontStyle.italic,
                color: color,
              ),
            ),
            Text(
              "SPORTSBOOK",
              style: TextStyle(
                fontSize: isLoginRegistration ? 12 : 10,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
