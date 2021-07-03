import 'package:flutter/cupertino.dart';
import 'package:quick_groceries/Model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/user.dart';
import '../Model/user.dart';

class DBHelperUser{

  Database LDB; //LocalDB
  String usersdb ='DB.db'; // DB Name
  String basketTableName ='Basket';
  String sql1='CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, password TEXT, gender TEXT, age INTEGER)';
  String sql2='CREATE TABLE Products (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, price DOUBLE,category TEXT, img TEXT)';
  String sql3='CREATE TABLE Basket (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price DOUBLE, img TEXT)';
  String tableName = 'Users';

  static DBHelperUser _dbHelperUser;
  DBHelperUser._getInstance();
  factory DBHelperUser (){
    if(_dbHelperUser==null) _dbHelperUser= DBHelperUser._getInstance();
    return _dbHelperUser;
  }

  initializeDB()async{
    WidgetsFlutterBinding.ensureInitialized();

    final Future<Database> db = openDatabase(
      join(await getDatabasesPath(), usersdb),
      onCreate: (db,ver){
        db.execute(sql1);
        db.execute(sql2);
        db.execute(sql3);
      },
      version: 1
    );
    LDB =await db;
  }

  addNewUser(User user)async{
    if(LDB==null) await initializeDB();
    LDB.insert(tableName, user.UserRecord());
  }

  CheckUser(String username , String password)async{
    if(LDB==null) await initializeDB();
    return await LDB.query(tableName,where: 'name=? and password=?',whereArgs: [username,password]);
  }

  Future<List<Map<String, dynamic>>> getAllUsers () async{
    if(LDB==null) await initializeDB();
    return await LDB.query(tableName);
  }
  //delete
  Future<List<Map<String, dynamic>>> getProductsCategory (String category) async{
    if(LDB==null) await initializeDB();
    return await LDB.query('Products',where:'category=?',whereArgs: [category]);
  }

  Future<List<Map<String, dynamic>>> getAllProducts () async{
    if(LDB==null) await initializeDB();
    return await LDB.query('Products');
  }

  addNewProduct(Product product)async{
    if(LDB==null) await initializeDB();
    LDB.insert('Products', product.ProductRecord());
  }

  addToBasket(Basket basketItem)async{
    if(LDB==null) await initializeDB();
    LDB.insert(basketTableName, basketItem.basketRecord());
  }
  Future<List<Map<String, dynamic>>> getBasket () async{
    if(LDB==null) await initializeDB();
    return await LDB.query(basketTableName);
  }

  deleteFromBasket(int id)async{
    if(LDB==null) await initializeDB();
    LDB.delete(basketTableName,where:'id=?',whereArgs: [id]);
  }

}