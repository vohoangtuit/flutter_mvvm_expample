import 'package:get_it/get_it.dart';
import 'package:mvvm/mvvm.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/network/api_response.dart';
import 'package:mvvm_example/network/rest_client.dart';

class BaseViewModel extends ViewModel{
  RestClient get api => GetIt.I<RestClient>();
  APIResponse<List<UserModel>> _apiResponse;
//@POST("user/login")
//    fun singIn(@Body request : UserModel) : Observable<UserSigninResponse>
//
//    @GET("user/getall")
//    fun getListUser() : Observable<GetListUser>
//
//    @GET("user/detail/{id}")
//    fun getUserDetail(@Path("id") id: String): Observable<GetDetailUser>
}