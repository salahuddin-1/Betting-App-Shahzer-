import 'package:flutter/material.dart';
import '../../Navigation/navigation.dart';
import '../../Widgets/text_button.dart';

class SwitchLoginRegistration extends StatelessWidget
    implements NavigationService {
  final String text;
  final String buttonTitle;
  final Widget screen;

  const SwitchLoginRegistration({
    Key key,
    @required this.text,
    @required this.buttonTitle,
    @required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.purple[50],
          ),
        ),
        CommonTextButton(
          title: buttonTitle,
          onPressed: () {
            navigateTo(screen, context);
          },
        ),
      ],
    );
  }

  @override
  void navigateTo(Widget screen, BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false,
    );
  }
}
