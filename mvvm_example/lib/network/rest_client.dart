import 'dart:convert';

import 'package:mvvm_example/models/user.dart';
import 'package:mvvm_example/network/api_response.dart';
import 'package:http/http.dart' as http;

class RestClient{
  static const API ="https://vohoangtu-authencation.herokuapp.com/api/";
  static const header={
    //'apiKey':'fe8d90c8-c1eb-4446-8abe-911b76065e2f',
    'Content-Type':'application/json'
};
  Future<APIResponse<List<UserModel>>> getAllUser(){
    return http.get(API+'user/getall',headers: header)
        .then((data) {
      if(data.statusCode==200){
        final jsonData = json.decode(data.body);
        final notes = <UserModel>[];
        for(var item in jsonData){
          notes.add(UserModel.fromJson(item));
        }
        return APIResponse<List<UserModel>>(data:notes);
      }
      return APIResponse<List<UserModel>>(error:true, errorMessage:'An error occured');
    }).catchError((_)=>APIResponse<List<UserModel>>(error:true, errorMessage:'An error occured'));
  }

}