import 'package:flutter/cupertino.dart';

class Utils{
  hideKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }
}