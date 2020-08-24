import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable(explicitToJson: true)
class UserRequest{
  String email;
  String password;
  String name;

  UserRequest.login({this.email, this.password});
  UserRequest.register({this.name,this.email, this.password});


  factory UserRequest.fromJson(Map<String, dynamic> item){
    return UserRequest.login(
      email: item['email'],
      password: item['password']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  @override
  String toString() {
    return '{email: $email, password: $password, name: $name}';
  }
}