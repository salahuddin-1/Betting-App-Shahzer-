import 'package:flutter/material.dart';

class SportsTile extends StatelessWidget {
  final IconData icon;
  final String sportsName;

  const SportsTile({Key key, this.icon, this.sportsName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            child: ListTile(
              leading: Icon(
                icon,
                size: 35,
                color: Colors.purple[900],
              ),
              title: Text(
                sportsName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
