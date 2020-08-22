import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_example/widget/text_style.dart';

class FormatDateTime{
  String formatTo_DD_MM_YYYY(int timestamp) {
    var format = new DateFormat('dd/MM/yyyy');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return format.format(date);
  }
  String formatTo_DD_MM_YYYY_HH_MM(int timestamp) {
    var format = new DateFormat('yyyy-MM-dd hh:mm');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return format.format(date);
  }
}
Text TextDate_DD_MM_YYYY(int timestamp){
  var format = new DateFormat('dd/MM/yyyy');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return Text(format.format(date),style: normalTextBlack(),textAlign: TextAlign.right);
}
Text TextDate_DD_MM_YYYY_HH_MM(int timestamp){
  var format = new DateFormat('yyyy-MM-dd hh:mm');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return Text(format.format(date),style: normalTextBlack(),textAlign: TextAlign.right);
}

Text TextMoneyFromString(String amount){
  return Text('${FlutterMoneyFormatter(settings: MoneyFormatterSettings(
    symbol: 'VNĐ',
    fractionDigits: 0,),amount: double.tryParse(amount)).output.symbolOnRight}',style: mediumTextRedBold());
}
Text TextMoneyFromInt(int amount){

  return Text('Price: '+'${FlutterMoneyFormatter(settings: MoneyFormatterSettings(
    symbol: 'VNĐ',
    fractionDigits: 0,),amount: double.tryParse(amount.toString())).output.symbolOnRight}',style: mediumTextRedBold());
}