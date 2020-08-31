import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm/mvvm.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/network/product/product_server.dart';

 class ProductBaseViewModel extends ViewModel{
  Dio dio;
  ProductServer network;
  final BaseStatefulState baseStatefulState;
  ProductBaseViewModel({this.baseStatefulState}) {
   dio = new Dio();
   network = new ProductServer(dio);
  }
  showLoading(bool show){
   if(show){
    baseStatefulState.showLoading();
   }else{
    baseStatefulState.hideLoading();
   }
  }
}