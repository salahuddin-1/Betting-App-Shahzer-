import 'package:flutter/material.dart';

import 'body_of_live_matches.dart';

class LiveMatchesScreen extends StatefulWidget {
  @override
  _LiveMatchesScreenState createState() => _LiveMatchesScreenState();
}

class _LiveMatchesScreenState extends State<LiveMatchesScreen>
    with AutomaticKeepAliveClientMixin<LiveMatchesScreen> {
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BodyOfLiveMatches(),
    );
  }
}
