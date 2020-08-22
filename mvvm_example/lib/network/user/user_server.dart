import 'package:dio/dio.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/models/user_login.dart';
import 'package:mvvm_example/network/base/user_base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_server.g.dart';
// todo: run comment restclient.g.dart =// cd root project : flutter pub run build_runner build
// https://vohoangtu-authencation.herokuapp.com/api/
// https://5f34f6e09124200016e19304.mockapi.io/api/v1/
@RestApi(baseUrl: "https://vohoangtu-authencation.herokuapp.com/api/")
abstract class UserServer{

  factory UserServer(Dio dio, {String baseUrl}) {
    Map<String, dynamic> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
      'Language': 'vi'
    };
    dio.options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
     // contentType: 'application/x-www-form-urlencoded',
      headers: requestHeaders,

    );
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true,request: true));

    return _UserServer(dio, baseUrl: baseUrl);
  }

  @POST("user/login")
  Future<UserBaseResponseModel> login(@Body() UserLogin userLogin);

}