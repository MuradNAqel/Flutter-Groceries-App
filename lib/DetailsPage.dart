import 'package:flutter/material.dart';
import 'package:quick_groceries/Model/user.dart';

import 'API/DBHelperUser.dart';
import 'Model/user.dart';

class detailsPage extends StatefulWidget {
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    DBHelperUser helper =DBHelperUser();
    Product prod = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.shopping_basket), onPressed:() {
          Navigator.pushNamed(context,'/Basket');
        },)],
      ),
      body: Container(
        child: Card(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(prod.img),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(height: 20,),
              Text(prod.name),
              SizedBox(height: 10,),
              Text('${prod.price.toString()}\$'),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Basket b =Basket(name:prod.name,img: prod.img,price: prod.price);
                helper.addToBasket(b);
              }, child: Text('Add to Basket'))
            ],
          ),
        ),
      ),
    );
  }
}
