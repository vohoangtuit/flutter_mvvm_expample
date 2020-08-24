import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/network/request/user_request.dart';
import 'package:mvvm_example/utils/shared_preference.dart';
import 'package:mvvm_example/viewmodels/user_viewmodel.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/button.dart';
import 'package:mvvm_example/widget/loading.dart';

import 'home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulState<SignUpScreen> {
  UserViewModel userViewModel = UserViewModel();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'Sign Up'),
        body: baseGestureDetector(context,
          Stack(
            children: <Widget>[
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
                                inputDecoration('Full name', Icons.person),
                                validator: (val) {
                                  return val.length >= 4
                                      ? null
                                      : "Full name >4= characters";
                                },
                                controller: _fullNameController,
                              ),
                              SizedBox(height: 20,),
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
                          title: 'Sign Up'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: isLoading ? widgetLoading() : null,
              )
            ],

          ),
        ));
  }

  _handelSigUp()async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading =true;
      });
      var userLogin =  UserRequest.register(name:_fullNameController.text,email:_emailController.text,password:_passwordController.text) ;
      var result =await userViewModel.register(userLogin);
      if(result!=null&&result.user!=null){
        setState(() {
          isLoading =false;
          _saveData(result.user);

        });
      }
      else{
        setState(() {
          isLoading =false;
        });
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        print("no data-----------------------");
      }
    }
  }
  _saveData(UserModel userModel){
    SharedPre.saveBool(SharedPre.sharedPreIsLogin, true);
    SharedPre.saveString(SharedPre.sharedPreFullName, userModel.name);
    SharedPre.saveString(SharedPre.sharedPreEmail, userModel.email);
    //SharedPre.saveString(SharedPre.sharedPreAvatar, userModel.avatar);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
}