import 'package:dio/dio.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_server.g.dart';
// todo: run comment restclient.g.dart =// cd root project : flutter pub run build_runner build
//https://github.com/trevorwang/retrofit.dart/
// https://vohoangtu-authencation.herokuapp.com/api/
// https://5f34f6e09124200016e19304.mockapi.io/api/v1/
@RestApi(baseUrl: "https://5f34f6e09124200016e19304.mockapi.io/api/v1/")
abstract class ProductServer{

  factory ProductServer(Dio dio, {String baseUrl}) {
    Map<String, dynamic> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
      'Language': 'vi'
    };
    dio.options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
      // contentType: 'application/json',
      headers: requestHeaders,

    );
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));

    return _ProductServer(dio, baseUrl: baseUrl);
  }

//
  @GET("/products")
  Future<List<Product>> getProducts();

  @GET("/products/{id}")
  Future<Product> getDetailProduct(@Path("id") String id);
}