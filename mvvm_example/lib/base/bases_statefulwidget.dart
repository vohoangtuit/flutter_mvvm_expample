import 'package:flutter/material.dart';
import 'package:mvvm_example/base/dialog.dart';
import 'package:mvvm_example/viewmodels/product_viewmodel.dart';
import 'package:mvvm_example/viewmodels/user_viewmodel.dart';
import 'package:mvvm_example/widget/progressbar.dart';
abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  BaseDialog  dialog;
 static BaseStatefulState baseStatefulState;
  ProductViewModel productViewModel;
  UserViewModel userViewModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProgressBar progressBar;
  bool onStart =false;
  @override
  Widget build(BuildContext context) {

    return Stack(
      key: _scaffoldKey,
      children: <Widget>[

      ],
    );
  }

  @override
  void initState() {
    super.initState();
    print("onStart "+onStart.toString());
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("onStart 1 "+onStart.toString());
    if(!onStart){
      baseStatefulState=this;
      productViewModel = new ProductViewModel(baseStatefulState);
      userViewModel = new UserViewModel(baseStatefulState);
      progressBar = ProgressBar();
      onStart =true;
    }
  }
  addFunction(Function function){
    Future.delayed(Duration.zero, () async {
      function();
    });
  }
  @override
  void dispose() {
    progressBar.hide();
    super.dispose();
  }
  void showLoading() {
    progressBar.show(context);
  }

  void hideLoading() {
    progressBar.hide();
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

}
