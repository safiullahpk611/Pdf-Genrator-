import 'package:flutter/material.dart';
class CustomTextFieldsEntry extends StatelessWidget {
  final maxLine,myController;
  CustomTextFieldsEntry({this.maxLine,this.myController}) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
        maxLines: maxLine,

        decoration: InputDecoration(
        border: OutlineInputBorder(
    )));
  }
}
