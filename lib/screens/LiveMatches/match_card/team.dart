import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  final black = Colors.black;
  final double betSize = 11;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          team(),
          score(),
          moveBetAmount2(),
          divider(),
          moveBetPercent(),
          divider(),
          moveBetAmount(),
        ],
      ),
    );
  }

  Widget divider() {
    return VerticalDivider(
      color: Colors.grey,
    );
  }

  Widget emptyBox() {
    return SizedBox(
      height: 4,
    );
  }

  Widget teamNameScore(String name, double width) {
    return Container(
      // color: Colors.pink,
      width: width,
      height: 24,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: black,
            fontSize: betSize,
          ),
        ),
      ),
    );
  }

  Widget score() {
    return Column(
      children: [
        teamNameScore("29", 50),
        emptyBox(),
        teamNameScore("41", 50),
      ],
    );
  }

  Widget team() {
    return Column(
      children: [
        teamNameScore("Real Madrid", 100),
        emptyBox(),
        teamNameScore("Guangdong", 100),
      ],
    );
  }

  Widget percentContainer(Color color, Color textColor, String number) {
    return Container(
      height: 25,
      width: 30,
      color: color,
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: textColor,
            fontSize: betSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget moveBetPercent() {
    return Column(
      children: [
        percentContainer(Colors.lightGreen[100], Colors.green, "100"),
        emptyBox(),
        percentContainer(Colors.red[100], Colors.red, "-70"),
      ],
    );
  }

  Widget betContainer(String text1, String text2) {
    return Container(
      height: 25,
      width: 40,
      color: Colors.blue[200],
      child: Column(
        children: [
          Expanded(
            child: Text(
              text1,
              style: TextStyle(
                color: Colors.black,
                fontSize: betSize,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text2,
              style: TextStyle(
                color: Colors.blue,
                fontSize: betSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget moveBetAmount() {
    return Column(
      children: [
        betContainer("0.169.5", "-110"),
        emptyBox(),
        betContainer("U 169.5", "-110"),
      ],
    );
  }

  Widget moveBetAmount2() {
    return Column(
      children: [
        betContainer("+2.5", "-110"),
        emptyBox(),
        betContainer("+2.5", "-110"),
      ],
    );
  }
}
