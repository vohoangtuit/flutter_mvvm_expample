import 'package:flutter/material.dart';
import 'package:mvvm_example/base/bases_statefulwidget.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:mvvm_example/utils/formats.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/text_style.dart';


class DetailProduct extends StatefulWidget {
  Product product;
  DetailProduct(this.product);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends BaseStatefulState<DetailProduct> {

  Product detail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'Detail'),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: detail!=null?Image.network(detail.image,fit:BoxFit.fill):null,
                ),
                SizedBox(height: 10,),

                Text(detail!=null?detail.name:"",style: mediumTextBlack(),),
                SizedBox(height: 10,),
                Container(
                  child: detail!=null? TextMoneyFromInt(widget.product.price):null,
                ),
                SizedBox(height: 10,),
                Container(
                  child: detail!=null? TextDate_DD_MM_YYYY_HH_MM(widget.product.createdAt):null,
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _getDetail();
    });
  }

  _getDetail()async{
    var result =await productViewModel.getDetailProduct(widget.product.id);
    if(result!=null&&result.data!=null){
      setState(() {
        detail =result.data;
        showBaseDialog('Message',detail.name);
      });

    }else{
      showBaseDialog('Message','Error Detail');
    }

  }
}
