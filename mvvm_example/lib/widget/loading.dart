import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Stack widgetLoading(){
  return Stack(
    children: [
      new Opacity(
        opacity: 0.3,
        child: const ModalBarrier(dismissible: false, color: Colors.grey),
      ),
      new Center(
        child: new CircularProgressIndicator(),
      ),
    ],
  );
}