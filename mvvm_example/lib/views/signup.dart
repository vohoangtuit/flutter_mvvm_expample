import 'package:flutter/material.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'SignUp'),
        body: baseGestureDetector(context,
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widgetLogo(),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                            inputDecoration('Enter Email', Icons.email),
                            validator: (val) {
                              return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                                  ? null
                                  : "Enter correct email";
                            },
                            controller: _emailController,
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            decoration:
                            inputDecoration('Enter Password', Icons.lock),
                            controller: _passwordController,
                            validator: (val) {
                              return val.length >= 6
                                  ? null
                                  : "Password >5= characters";
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            decoration:
                            inputDecoration('Confirm Password', Icons.lock),
                            controller: _repasswordController,
                            // ignore: missing_return
                            validator: (val) {
                            //  print(" val ${val.toString()}");
//                              if(val.length<6){
//                                return "Password >5= characters";
//                              }
                              if(_passwordController.text!= _repasswordController.text){
                                return "Password not match";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NormalButton(
                      onPressed: () {
                        _handelSigUp();
                      },
                      title: 'Sig Up'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _handelSigUp() {
    if (formKey.currentState.validate()) {
      print("validate data");
    }
  }
}