
import '../Basket.dart';

class User {
  int id;
  String name;
  String password;
  String gender;
  int age;

  User({this.id,this.name,this.password,this.gender,this.age});

  Map<String,dynamic> UserRecord(){
    return
      {
        'id':id,
        'name':name,
        'password':password,
        'gender':gender,
        'age':age
      };
  }
}

class Product {
  int id;
  String name;
  String description;
  double price;
  String category;
  String img;
  Product({this.id,this.name,this.description,this.price,this.category,this.img});

  Map<String,dynamic> ProductRecord(){
    return
      {
        'id':id,
        'name':name,
        'description':description,
        'price':price,
        'category':category,
        'img':img,
      };
  }
}

class Basket {
  int id;
  String name;
  double price;
  String img;
  Basket({this.id,this.name,this.price,this.img});

  Map<String,dynamic> basketRecord(){
    return
      {
        'id':id,
        'name':name,
        'price':price,
        'img':img,
      };
  }
}