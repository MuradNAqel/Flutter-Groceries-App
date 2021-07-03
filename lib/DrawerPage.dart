import 'package:flutter/material.dart';
import 'package:quick_groceries/FruitsPage.dart';
import 'package:quick_groceries/Model/user.dart';
import 'package:quick_groceries/StartUpPage.dart';

import 'Basket.dart';
import 'HomePage.dart';

class drawerPage extends StatefulWidget {
  @override
  _drawerPageState createState() => _drawerPageState();
}

class _drawerPageState extends State<drawerPage> {

  Widget activePage = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Quick Groceries')),
        body: activePage,
        drawer: Drawer(
          elevation: 10,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),)
                    ],
                  )
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: (){
                  setState(() {
                    activePage = HomePage();
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart_rounded),
                title: Text('Basket'),
                onTap: (){
                  setState(() {
                    activePage = basket();
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: Text('Log Out'),
                onTap: (){
                  setState(() {
                    activePage = StartUpPage();
                    Navigator.pop(context);
                  });
                },
              )
            ],
          ),
        ),


    );
  }
}
