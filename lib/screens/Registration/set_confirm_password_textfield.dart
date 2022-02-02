import 'package:flutter/material.dart';

import '../../Widgets/text_field.dart';

class SetConfirmPasswordTextField extends StatelessWidget {
  final _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: "  Confirm Password",
      onChanged: () {},
      textEditingController: _textEditingController,
    );
  }
}
