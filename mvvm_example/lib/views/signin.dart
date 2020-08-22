import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/models/user_login.dart';
import 'package:mvvm_example/utils/shared_preference.dart';
import 'package:mvvm_example/utils/utils.dart';
import 'package:mvvm_example/viewmodels/user_viewmodel.dart';
import 'package:mvvm_example/views/home.dart';
import 'package:mvvm_example/views/signup.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/button.dart';

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
  @override
  void initState() {
    super.initState();
    _emailController.text ='vohoangtu2401@gmail.com';
    _passwordController.text ='123456';
  }


  _handelSigIn() async{
    if (formKey.currentState.validate()) {
      print("validate data");

      setState(() {
        isLoading =true;
      });
      UserLogin userLogin = new UserLogin(_emailController.text,_passwordController.text);
      var result =await userViewModel.login(userLogin);
      if(result!=null&&result.data!=null){

        setState(() {
          isLoading =false;
          _saveData(result.data);

        });
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
