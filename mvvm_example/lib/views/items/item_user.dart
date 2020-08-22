
import 'package:flutter/material.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/widget/text_style.dart';

class ItemUser extends StatefulWidget {
  UserModel userModel;
  Function onTap;
  ItemUser(this.userModel,this.onTap);
  @override
  _ItemUserState createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemUser> {
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: InkWell(
        onTap: widget.onTap,
        child:  Container(
         // height: 60,
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child:  Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.userModel.name,style: textBlueMedium(), overflow: TextOverflow.ellipsis,
                              maxLines: 2,),
                            SizedBox(height: 5,),
                            Text(" "+widget.userModel.email,style: normalTextBlack()),
                          ],
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