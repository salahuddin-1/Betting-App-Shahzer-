import 'package:flutter/material.dart';

import 'body_of_live_matches.dart';

<<<<<<< HEAD
class LiveMatchesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
=======
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
>>>>>>> 2892b94 (Second commit)
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BodyOfLiveMatches(),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2892b94 (Second commit)
