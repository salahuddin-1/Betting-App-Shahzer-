import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Constants/getx_passDataConstant.dart';
import 'package:news_app/GetX/getx_passing_data.dart';
import 'package:news_app/Widgets/text_field.dart';
import 'package:news_app/model/registerAUserObj.dart';

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
