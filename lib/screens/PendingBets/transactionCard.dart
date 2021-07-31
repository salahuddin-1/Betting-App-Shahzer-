import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';

class TransactionDart {
  static final _color = Colors.white;

  static Widget card(IconData icon, String title) {
    return Card(
      color: Colors.purple[900],
      child: Container(
        width: Device.width * .45,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: _color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: _color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
