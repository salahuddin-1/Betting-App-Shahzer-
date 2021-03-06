import 'package:flutter/material.dart';

class MoreWagers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "More wagers",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Icon(
            Icons.chevron_right_sharp,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
