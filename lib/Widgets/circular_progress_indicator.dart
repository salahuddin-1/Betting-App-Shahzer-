import 'package:flutter/material.dart';

class MyCircularProgress {
  static Widget progress() {
    return Center(
      child: Container(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: Colors.purple[900],
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
