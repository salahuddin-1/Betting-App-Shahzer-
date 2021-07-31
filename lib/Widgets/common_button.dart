import 'package:flutter/material.dart';
import 'package:news_app/Constants/getx_passDataConstant.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function onPressed;
<<<<<<< HEAD
=======
  final bool wantWidget;
  final Widget widget;
>>>>>>> 2892b94 (Second commit)

  const CommonButton({
    Key key,
    @required this.title,
    this.onPressed,
<<<<<<< HEAD
=======
    this.wantWidget = false,
    this.widget,
>>>>>>> 2892b94 (Second commit)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 39,
      color: Colors.white,
      onPressed: () {
        onPressed();
      },
<<<<<<< HEAD
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
=======
      child: (wantWidget)
          ? widget
          : Container(
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
>>>>>>> 2892b94 (Second commit)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
