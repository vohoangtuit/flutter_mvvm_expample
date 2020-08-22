

import 'package:mvvm_example/network/base/server_errror.dart';

class BaseResponseModel<T> {
  ServerError serverError;
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
}