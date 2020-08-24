import 'package:flutter/material.dart';
import 'package:mvvm_example/base/dialog.dart';
import 'package:mvvm_example/widget/loading.dart';
import 'package:mvvm_example/widget/loadingdialog.dart';


abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  bool isLoading =false;
  LoadingDialog loadingDialog;
  BaseDialog  dialog;
 static BaseStatefulState baseStatefulState;
  var  restApi;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Stack(
      key: _scaffoldKey,
      children: <Widget>[
        Container(
          child: isLoading?widgetLoading():Container() ,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    baseStatefulState=this;
   // restApi =  RestClient(baseStatefulState:baseStatefulState);
  }

  void baseMethod() {
    // Parent method
  }
  showBaseDialog(String title,String description){
    if(dialog!=null){
      dialog.dismiss();
      dialog =null;
    }
    dialog = BaseDialog(title: title, description: description);
    showDialog(
     // barrierDismissible: false,// touch outside dismiss
     context: context,
       // context: _scaffoldKey.currentContext,
      builder: (BuildContext context) => dialog
    );
  }

  void showLoading(bool show)async{
    await  Future.delayed(Duration(milliseconds: 30));
    setState(() async{
      if(show){
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
            loadingDialog = loadingDialog ?? LoadingDialog());
      }else{
        if (loadingDialog != null && loadingDialog.isShowing()) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          loadingDialog = null;
        }
      }
    });

  }

}
