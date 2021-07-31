import 'package:flutter/material.dart';

class DialogBox {
  static Future infoDialog(BuildContext context, String title) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
