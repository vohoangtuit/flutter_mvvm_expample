import 'package:flutter/material.dart';
import 'package:mvvm_example/utils/shared_preference.dart';
import 'package:mvvm_example/views/home.dart';
import 'package:mvvm_example/views/signin.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/text_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widgetLogo(),
            SizedBox(height: 20,),
            Text('Welcome',style: textBlueMedium(),textAlign: TextAlign.center,)
          ],
        ),
      )),
    );
  }
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  checkLogin()async{
    await SharedPre.getBoolKey(SharedPre.sharedPreIsLogin).then((value){
      Future.delayed(Duration(seconds: 3),()async{
        if(value!=null){
          if(value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
          }
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
        }
      }
      );
    });

  }
}
