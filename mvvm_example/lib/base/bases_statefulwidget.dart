import 'package:flutter/material.dart';
import 'package:mvvm_example/base/dialog.dart';
import 'package:mvvm_example/viewmodels/product_viewmodel.dart';
import 'package:mvvm_example/viewmodels/user_viewmodel.dart';
import 'package:mvvm_example/widget/loading.dart';
import 'package:mvvm_example/widget/loadingdialog.dart';


abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  bool isLoading =false;
  LoadingDialog loadingDialog;
  BaseDialog  dialog;
 static BaseStatefulState baseStatefulState;
  ProductViewModel productViewModel;
  UserViewModel userViewModel;
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
    productViewModel = new ProductViewModel(baseStatefulState);
    userViewModel = new UserViewModel(baseStatefulState);
  }

  void baseMethod() {
    // Parent method
  }
  showBaseDialog(String title,String description){
    dialog = new BaseDialog(title: title, description: description);
    showDialog(
     // barrierDismissible: false,// touch outside dismiss
     context: context,
       // context: _scaffoldKey.currentContext,
      // ignore: missing_return
      builder: (BuildContext context) =>dialog
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
