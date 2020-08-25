import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:mvvm_example/network/base/base_response.dart';
import 'package:mvvm_example/network/base/server_errror.dart';
import 'package:mvvm_example/viewmodels/product/base_product_viewmodel.dart';

class ProductViewModel extends ProductBaseViewModel{
  final BaseStatefulState baseStatefulState;
  ProductViewModel(this.baseStatefulState);
  Future<BaseResponseModel<List<Product>>> getProducts() async {
    List<Product> response;
    try {
      response = await network.getProducts();
    } catch (error, stacktrace) {
      baseStatefulState.showBaseDialog("Error",ServerError().getError(error));
      return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }
  Future<BaseResponseModel<Product>> getDetailProduct(String id) async {
    Product response;
    try {
      response = await network.getDetailProduct(id);
    } catch (error, stacktrace) {
      baseStatefulState.showBaseDialog("Error",ServerError().getError(error));
      return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }
}