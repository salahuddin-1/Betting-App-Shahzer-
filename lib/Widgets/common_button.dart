import 'package:flutter/material.dart';
import 'package:news_app/Constants/getx_passDataConstant.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CommonButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 39,
      color: Colors.white,
      onPressed: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
