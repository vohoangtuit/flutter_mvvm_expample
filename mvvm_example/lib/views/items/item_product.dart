
import 'package:flutter/material.dart';
import 'package:mvvm_example/models/product.dart';
import 'package:mvvm_example/utils/formats.dart';
import 'package:mvvm_example/widget/text_style.dart';


class ItemProduct extends StatefulWidget {
  Product product;
  Function onTap;
  ItemProduct(this.product,this.onTap);
  @override
  _ItemUserState createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemProduct> {

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMillisecondsSinceEpoch(1000 * 1000);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: InkWell(
        onTap: widget.onTap,
        child:  Container(
           height: 100,
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: widget.product.image.isNotEmpty?Image.network(widget.product.image,width: 90,height: 100,):Image.asset('assets/images/logo.png',width: 90,height: 100,fit:BoxFit.fill),
                  ),
                  Flexible(
                    child:  Column(
                      children: <Widget>[
                        Padding(
                          //padding: const EdgeInsets.all(8.0),
                          padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.product.name,style: textBlueMediumBold(), overflow: TextOverflow.ellipsis,
                                maxLines: 2,),
                              SizedBox(height: 10,),
                              TextMoneyFromInt(widget.product.price),
                              SizedBox(height: 10,),
                              Align(alignment: Alignment.bottomRight,
                                //child: Text(DateTime.fromMillisecondsSinceEpoch(widget.product.createdAt * 1000).toString(),style: normalTextRed(),textAlign: TextAlign.right),
                                child: TextDate_DD_MM_YYYY(widget.product.createdAt)
                              ),
                              
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
}