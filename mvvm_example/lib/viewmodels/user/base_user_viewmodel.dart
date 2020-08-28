import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm/mvvm.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'file:///C:/TU/Develop/Demo/flutter_mvvm_example/mvvm_example/lib/network/product/product_server.dart';
import 'package:mvvm_example/network/user/user_server.dart';

 class UserBaseViewModel extends ViewModel{
  Dio dio;
  UserServer restApi;
  final BaseStatefulState baseStatefulState;
//  final Function(String message) errorMessage;
  UserBaseViewModel({this.baseStatefulState}) {
   dio = new Dio();
   restApi = new UserServer(dio);
  //final client = UserServer(dio, baseUrl: "your base url");//Multiple endpoints support
  }
  showLoading(bool show){
   if(show){
    baseStatefulState.showLoading();
   }else{
    baseStatefulState.hideLoading();
   }
  }
}