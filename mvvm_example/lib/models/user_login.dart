import 'package:json_annotation/json_annotation.dart';

//part 'user_login.g.dart';
@JsonSerializable()
class UserLogin{
  String email;
  String password;

  UserLogin(this.email, this.password);

//  factory UserLogin.fromJson(Map<String, dynamic> item){
//    return UserLogin(
//      email: item['email'],
//      password: item['password']
//    );
//  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return '{email: $email, password: $password}';
  }
}