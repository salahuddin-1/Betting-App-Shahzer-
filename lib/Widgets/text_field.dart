import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final Function onFieldSubmitted;
  final TextEditingController textEditingController;

  CommonTextField({
    Key key,
    @required this.hintText,
    this.onChanged,
    this.textEditingController,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: (val) {
        onChanged();
      },
      onFieldSubmitted: (val) {
        onFieldSubmitted();
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
