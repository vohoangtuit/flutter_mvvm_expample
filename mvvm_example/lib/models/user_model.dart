class UserModel {
  String id;
  String name;
  String email;
  String password;
  String avatar;
 // DateTime created;
  String created;


  UserModel({this.id, this.name, this.email, this.password, this.avatar, this.created});

//  UserModel.login({this.email, this.password});
//  UserModel.register({this.name,this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> item){
    return UserModel(
      id: item['_id'],
      name: item['name'],
      email: item['email'],
      password: item['password'],
      avatar: item['avatar']!=null?item['avatar']:null,
      // created: item['created']!=null?DateTime.parse(item['created']):null,
      // created: item['created'],
    );
  }

}