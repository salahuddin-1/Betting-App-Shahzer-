import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/getx_passDataConstant.dart';
import '../../GetX/getx_passing_data.dart';
import '../../Widgets/text_field.dart';
import '../../model/registerAUserObj.dart';

class SetEmailTextField extends StatelessWidget {
  final _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: "  Email Address",
      onFieldSubmitted: () {
        GetXPassDataConstant.getxPassData.setEmail(_textEditingController.text);
      },
      onChanged: () {
        print("g");
      },
      textEditingController: _textEditingController,
    );
  }
}
