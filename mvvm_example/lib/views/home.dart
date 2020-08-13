import 'package:flutter/material.dart';
import 'package:mvvm_example/widget/basewidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'Home'),
      body: Container(

      ),
    );
  }
}