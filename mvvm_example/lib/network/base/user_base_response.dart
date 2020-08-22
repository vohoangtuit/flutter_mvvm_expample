
import 'package:mvvm_example/network/base/server_errror.dart';

class UserBaseResponseModel<T> {
  ServerError serverError;
  int status;
  String message;
  String token;

  T data;

  setException(ServerError error) {
    serverError = error;
  }

  setData(T data) {
    this.data = data;
  }


  get getServerError {
    return serverError;
  }


  UserBaseResponseModel({this.status, this.message, this.token, this.data});

  factory UserBaseResponseModel.fromJson(Map<String, dynamic> item){
    return UserBaseResponseModel(
        status: item['status'],
        message: item['message'],
        token: item['token'],
        data: item['data']
    );
  }

  @override
  String toString() {
    return 'UserBaseResponseModel{status: $status, message: $message, token: $token, data: $data}';
  }
}