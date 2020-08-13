import 'package:flutter/material.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/widget/basewidget.dart';

class DetailUser extends StatefulWidget {
  final UserModel userModel;

  DetailUser(this.userModel);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'Detail'),
      body: Container(

      ),
    );
  }
}
