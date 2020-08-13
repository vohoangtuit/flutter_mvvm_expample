import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/widget/text_style.dart';

Widget materialApp(BuildContext context, String title) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
  );
}

Widget appBarWithTitle(BuildContext context, String title) {
  return AppBar(
    title: Text(title, style: titleTextWhite()),
    centerTitle: true,
  );
}

InputDecoration inputDecoration(
    String labelText, String hintText, String errorText) {
  return InputDecoration(
    // labelText: labelText ,
    hintText: hintText,
    // errorText: errorText,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  );
}

Decoration decorationMessageRight(){
  return BoxDecoration(
   color: Colors.blue,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23),bottomLeft: Radius.circular(23)),
  );
}
Decoration decorationMessageLeft(){
  return BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23),bottomRight: Radius.circular(23)),
  );
}
BoxDecoration decorationButton(Color color, double borderRadius) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(borderRadius),
  );
}
