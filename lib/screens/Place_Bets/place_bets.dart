import 'package:flutter/material.dart';

import 'body_of_placebets.dart';

class PlaceBets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // body: Parlay(),
        body: TabBarView(
          children: [
            BodyOfPlaceBets(),
            BodyOfPlaceBets(
              isParlay: true,
            ),
          ],
        ),
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Tabs(text: "SINGLE"),
              Tabs(text: "PARLAY"),
            ],
            indicatorColor: Colors.purple[900],
          ),
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final String text;

  const Tabs({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
      ),
    );
  }
}
