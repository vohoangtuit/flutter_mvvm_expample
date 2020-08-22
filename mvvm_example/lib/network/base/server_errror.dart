import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int _errorCode;
  String errorMessage = "";
  ServerError();
  ServerError.withError({DioError error}) {
    _handleError(error);
  }

  String getError(DioError error){
   return errorMessage =_handleError(error).toString();
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorMessage = "Request was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorMessage = "Connection timeout";
        break;
      case DioErrorType.DEFAULT:
        errorMessage =
        "Please check internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.RESPONSE:
        errorMessage =
        "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorMessage = "Receive timeout in send request";
        break;
    }
    return errorMessage;
  }
}