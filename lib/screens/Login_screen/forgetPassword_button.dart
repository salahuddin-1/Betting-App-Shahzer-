import 'package:flutter/material.dart';
import 'package:news_app/Widgets/text_button.dart';

class LoginForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.black,
                value: true,
                onChanged: (val) {
                  print('Checkbox clicked');
                },
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.purple[50],
                ),
              ),
            ],
          ),
        ),
        CommonTextButton(
          title: "Forget password??",
          onPressed: () {},
          textStyle: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
