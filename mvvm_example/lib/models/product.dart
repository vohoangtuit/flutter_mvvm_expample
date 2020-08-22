import 'package:json_annotation/json_annotation.dart';
@JsonSerializable(explicitToJson: true)
class Product{
  String id;
  String name;
  String image;
  int price;
  int createdAt;

  Product({this.id, this.name, this.image, this.price,
    this.createdAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;

    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, image: $image, price: $price, createdAt: $createdAt}';
  }
}