
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/network/base/server_errror.dart';
import 'package:mvvm_example/network/base/user_base_response.dart';
import 'package:mvvm_example/network/request/user_request.dart';
import 'package:mvvm_example/viewmodels/user/base_user_viewmodel.dart';

class UserViewModel extends UserBaseViewModel{
  final BaseStatefulState baseStatefulState;
  UserViewModel(this.baseStatefulState);
  Future<UserBaseResponseModel> login(UserRequest userLogin) async {
    showLoading(true);
    UserModel userModel;
    try {
      UserBaseResponseModel response = await restApi.login(userLogin);
      if(response!=null){
        if(response.user!=null){
          userModel =response.user;
        }else{
          return UserBaseResponseModel.Error(status:response.status,message:response.message);
        }
        showLoading(false);
      }
    } catch (error, stacktrace) {
      showLoading(false);
      return UserBaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return UserBaseResponseModel()..user = userModel;
  }

  Future<UserBaseResponseModel> register(UserRequest userLogin) async {
    UserModel userModel;
    showLoading(true);
    try {
      UserBaseResponseModel response = await restApi.register(userLogin);
      if(response!=null){
        showLoading(false);
        if(response.user!=null){
          userModel =response.user;
        }else{
          return UserBaseResponseModel.Error(status:response.status,message:response.message);
        }
      }

    } catch (error, stacktrace) {
      showLoading(false);
      return UserBaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return UserBaseResponseModel()..user = userModel;
  }
}