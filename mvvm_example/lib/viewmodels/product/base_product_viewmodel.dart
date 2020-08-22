import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm/mvvm.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'file:///C:/TU/Develop/Demo/flutter_mvvm_example/mvvm_example/lib/network/product/product_server.dart';

 class ProductBaseViewModel extends ViewModel{
  Dio dio;
  ProductServer network;
  final BaseStatefulState baseStatefulState;
//  final Function(String message) errorMessage;
  ProductBaseViewModel({this.baseStatefulState}) {
   dio = new Dio();
   network = new ProductServer(dio);
  }
}