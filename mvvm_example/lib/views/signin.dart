import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/network/request/user_request.dart';
import 'package:mvvm_example/utils/shared_preference.dart';
import 'package:mvvm_example/utils/utils.dart';
import 'package:mvvm_example/viewmodels/user_viewmodel.dart';
import 'package:mvvm_example/views/home.dart';
import 'package:mvvm_example/views/signup.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/button.dart';
import 'package:mvvm_example/widget/loading.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseStatefulState<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserViewModel userViewModel = UserViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithTitle(context, 'SignIn'),
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
                          title: 'Sign in'),
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
              Center(
                child: isLoading ? widgetLoading() : null,
              )
            ],
          ),
        ));
  }
  @override
  void initState() {
    super.initState();
    _emailController.text ='test1@gmail.com';
    _passwordController.text ='123456';
  }


  _handelSigIn() async{
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading =true;
      });
      UserRequest userLogin = new UserRequest.login(email:_emailController.text,password:_passwordController.text);
      var result =await userViewModel.login(userLogin);
      if(result!=null){
        if(result.user!=null){
          setState(() {
            isLoading =false;
            _saveData(result.user);

          });
        }else{
          setState(() {
            isLoading =false;
          });
          showBaseDialog('Error', result.message);

        }

      }
      else{
        setState(() {
          isLoading =false;
        });
        print("no data-----------------------");
      }
    }
  }
  _saveData(UserModel userModel){
    SharedPre.saveBool(SharedPre.sharedPreIsLogin, true);
    SharedPre.saveString(SharedPre.sharedPreFullName, userModel.name);
    SharedPre.saveString(SharedPre.sharedPreEmail, userModel.email);
    SharedPre.saveString(SharedPre.sharedPreAvatar, userModel.avatar);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
}
