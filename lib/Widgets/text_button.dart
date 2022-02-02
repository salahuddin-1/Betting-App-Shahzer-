import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final TextStyle textStyle;

  const CommonTextButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.textStyle = const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
