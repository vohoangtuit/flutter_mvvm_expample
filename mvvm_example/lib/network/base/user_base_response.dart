
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/network/base/server_errror.dart';

class UserBaseResponseModel<T> {
  ServerError serverError;
  int status;
  String message;
  String token;

  UserModel user;


  setException(ServerError error) {
    serverError = error;
  }

  setUser(UserModel user) {
    this.user = user;
  }


  get getServerError {
    return serverError;
  }


  UserBaseResponseModel({this.status, this.message, this.token, this.user});

  factory UserBaseResponseModel.fromJsonLogin(Map<String, dynamic> user){
    return UserBaseResponseModel(
        status: user['status'],
        message: user['message'],
        token: user['token']!=null?user['token']:null,
        user: user['user']!=null?UserModel.fromJson(user['user']):null,
    );
  }
  factory UserBaseResponseModel.fromJsonRegister(Map<String, dynamic> user){
    return UserBaseResponseModel(
      status: user['status'],
      message: user['message'],
      user: user['users']!=null?UserModel.fromJson(user['users']):null,
    );
  }
}