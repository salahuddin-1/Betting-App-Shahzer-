import 'package:flutter/material.dart';
import '../../Constants/getx_passDataConstant.dart';
import '../../Widgets/text_field.dart';

class SetUserNameTextField extends StatelessWidget {
  final _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: "  Pick a username",
      onFieldSubmitted: () {
        GetXPassDataConstant.getxPassData
            .setUsername(_textEditingController.text);
      },
      textEditingController: _textEditingController,
    );
  }
}
