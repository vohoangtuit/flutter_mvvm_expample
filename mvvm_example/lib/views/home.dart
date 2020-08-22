import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:mvvm_example/viewmodels/product_viewmodel.dart';
import 'package:mvvm_example/views/items/item_product.dart';
import 'package:mvvm_example/views/items/item_user.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/loading.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  var productModel = new ProductViewModel();
  List<Product> list = List<Product>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'Home'),
      body: Stack(
        children: <Widget>[
          initListView(),
          Center(
            child: isLoading ? widgetLoading() : null,
          )
        ],
      ),
    );
  }
  ListView initListView(){
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,height: 1,
      ),
      itemCount: list!=null?list.length:0,
      itemBuilder: (context,index){
        return ItemProduct(list[index],(){
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailUser(listUser[index])));
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _getData();
  }
  _getData()async{
    setState(() {
      isLoading =true;
    });
    var result =await productModel.getProducts();
    if(result!=null&&result.data!=null){
      setState(() {
        isLoading =false;
        list=result.data ;
      });
    }
    else{
      setState(() {
        isLoading =false;
      });
      print("no data-----------------------");
    }
  }
}