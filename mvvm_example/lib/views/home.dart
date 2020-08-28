import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:mvvm_example/utils/shared_preference.dart';
import 'package:mvvm_example/views/detail_product.dart';
import 'package:mvvm_example/views/items/item_product.dart';
import 'package:mvvm_example/views/signin.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  List<Product> list = List<Product>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: appBarWithTitle(context,'Home'),
      appBar: AppBar(title: Text('Home'),centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              SharedPre.clearData();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignInScreen()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          initListView(),
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailProduct(list[index])));
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _getData();
    });
  }
  _getData()async{
    var result =await productViewModel.getProducts();
    if(result!=null&&result.data!=null){
      setState(() {
        list=result.data ;
      });
    }
    else{
      showBaseDialog("Error", result.getServerError.toString());
      print("no data-----------------------");
    }
  }
}