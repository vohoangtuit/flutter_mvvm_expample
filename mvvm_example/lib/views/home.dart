import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/network/api_response.dart';
import 'package:mvvm_example/network/rest_client.dart';
import 'package:mvvm_example/views/items/item_user.dart';
import 'package:mvvm_example/widget/basewidget.dart';
import 'package:mvvm_example/widget/loading.dart';

import 'detail_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RestClient get api => GetIt.I<RestClient>();

  APIResponse<List<UserModel>> _apiResponse;

  List<UserModel>listUser =List<UserModel>();
  bool _isLoading =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context,'Home'),
      body: Stack(
        children: <Widget>[
          initListView(),
          Center(
            child: _isLoading ? widgetLoading() : null,
          )
        ],
      ),
    );
  }
  ListView initListView(){
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,height: 1,
        //indent: 10.0,// padding left
       // endIndent: 20,// padding right
      ),
      itemCount: listUser!=null?listUser.length:0,
      itemBuilder: (context,index){
        return ItemUser(listUser[index],(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailUser(listUser[index])));
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _getAllUser();
  }
  _getAllUser()async{
    setState(() {
      _isLoading =true;
    });
    _apiResponse = await api.getAllUser();
    if(_apiResponse.data!=null){
      setState(() {
        listUser =_apiResponse.data;
        _isLoading = false;
      });
    }else{
      setState(() {
        _isLoading = false;
      });
    }

  }
}