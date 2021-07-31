import 'package:flutter/material.dart';

class PendingBetsContainer {
  static final color = Colors.purple[900];
  static Widget container() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      // padding: EdgeInsets.symmetric(horizontal: 10),
      // height: 150,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "PENDING BETS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text("Pending Stake 0.00 WGR"),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 2,
            color: Colors.white,
          ),
          Container(
            color: Colors.purple[800],
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("DATE"),
                Text("BET"),
                Text("ODDS"),
                Text("TOWN"),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(1),
                  child: Text("Previous"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(1),
                  color: color,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(1),
                  child: Text("Next"),
                ),
              ],
            ),
          )
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Table(
          //     border: TableBorder.all(
          //       color: Colors.white,
          //     ),
          //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //     children: [
          //       TableRow(
          //         children: [
          //           Text("Previous"),
          //           Text("1"),
          //           Text("Next"),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
