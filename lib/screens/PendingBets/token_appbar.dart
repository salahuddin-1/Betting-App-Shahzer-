import 'package:flutter/material.dart';

class TokenAppBar {
  static Widget tokens(String amount) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: Colors.yellow[700],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
