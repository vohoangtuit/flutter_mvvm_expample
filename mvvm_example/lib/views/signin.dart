import 'package:flutter/material.dart';
import 'package:mvvm_example/utils/utils.dart';
import 'package:mvvm_example/views/home.dart';
import 'package:mvvm_example/views/signup.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithTitle(context, 'SignIn'),
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
                                inputDecoration('Email', Icons.email),
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Enter correct email";
                            },
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration:
                                inputDecoration('Password', Icons.lock),
                            controller: _passwordController,
                            validator: (val) {
                              return val.length >= 6
                                  ? null
                                  : "Password 6+ characters";
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
                        _handelSigIn();
                      },
                      title: 'Sig in'),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black87,
                              fontSize: 15),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _handelSigIn() {
    if (formKey.currentState.validate()) {
      print("validate data");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    }
  }
}
