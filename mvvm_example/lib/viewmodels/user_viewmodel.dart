import 'dart:convert';

import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/models/user_login.dart';
import 'package:mvvm_example/network/base/base_response.dart';
import 'package:mvvm_example/network/base/server_errror.dart';
import 'package:mvvm_example/network/base/user_base_response.dart';
import 'package:mvvm_example/viewmodels/user/base_user_viewmodel.dart';

class UserViewModel extends UserBaseViewModel{
  Future<UserBaseResponseModel> login(UserLogin userLogin) async {
    UserModel userModel;
    try {
      UserBaseResponseModel response = await restApi.login(userLogin);
      if(response!=null){
        print("login response "+response.toString());
        print("login response message "+response.message);
        print("login response status"+response.status.toString());
        userModel =response.data;
      }else{
        print('login response null');
      }

   //  print("userModel response "+userModel.toString());
    } catch (error, stacktrace) {
       print("Exception occured: $error stackTrace: $stacktrace");
    //  baseStatefulState.showBaseDialog("Error",ServerError().getError(error));
      return UserBaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return UserBaseResponseModel()..data = userModel;
  }
}