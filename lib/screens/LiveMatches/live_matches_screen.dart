import 'package:flutter/material.dart';

import 'body_of_live_matches.dart';

class LiveMatchesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BodyOfLiveMatches(),
    );
  }
}