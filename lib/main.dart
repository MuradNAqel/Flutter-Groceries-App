import 'package:flutter/material.dart';
import 'package:quick_groceries/DetailsPage.dart';
import 'package:quick_groceries/FruitsPage.dart';
import 'package:quick_groceries/HomePage.dart';
import 'package:quick_groceries/SignUpPage.dart';
import 'package:quick_groceries/StartUpPage.dart';

import 'Basket.dart';
import 'DrawerPage.dart';
import 'Model/user.dart';

void main() =>
    runApp(MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> StartUpPage(),
        '/HomePage' :(context)=> drawerPage(),
        '/FruitsPage':(context)=> fruitsPage(),
        '/SignUpPage':(context)=> SignUpPage(),
        '/DetailsPage':(context)=>detailsPage(),
        '/Basket':(context)=> basket(),
      },
    ));

