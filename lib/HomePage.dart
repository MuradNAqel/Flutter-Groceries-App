import 'package:flutter/material.dart';
import 'package:quick_groceries/Model/user.dart';
import 'API/DBHelperUser.dart';
import 'FruitsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DBHelperUser helperUser = DBHelperUser();
  List<Product> productsList = [];
  List<Product> CategoriesList = [];
  List<Map<String, dynamic>> getproductsFromDB = [];

  List<Map<String, dynamic>> productsMap=[];

  Product fruit1 = Product(
      name: 'Apple',
      price: 1.5,
      description: 'Byu per Kilo',
      category: 'fruit',
      img: 'assets/images/apple.png');
  Product fruit2 = Product(
      name: 'Banana',
      price: 1.75,
      description: 'Byu per Kilo',
      category: 'fruit',
      img: 'assets/images/Banana.jpg');
  Product fruit3 = Product(
      name: 'Pineapple',
      price: 3.10,
      description: 'Byu per piece',
      category: 'fruit',
      img: 'assets/images/pineapple.jpg');
  Product fruit4 = Product(
      name: 'Orange',
      price: 2.75,
      description: 'Byu per Kilo',
      category: 'fruit',
      img: 'assets/images/orange.png');
  Product fruit5 = Product(
      name: 'Kewi',
      price: 3.10,
      description: 'Byu per Kilo',
      category: 'fruit',
      img: 'assets/images/kiwi.png');

  Product vegitable1 = Product(
      name: 'Potato',
      price: 0.75,
      description: 'Byu per kilo',
      category: 'vegetable',
      img: 'assets/images/potato.jpg');
  Product vegitable2 = Product(
      name: 'Beet',
      price: 2.25,
      description: 'Byu per kilo',
      category: 'vegetable',
      img: 'assets/images/beet.jpg');
  Product vegitable3 = Product(
      name: 'Tomato',
      price: 0.45,
      description: 'Byu per kilo',
      category: 'vegetable',
      img: 'assets/images/tomato.jpg');
  Product vegitable4 = Product(
      name: 'Carrot',
      price: 0.90,
      description: 'Byu per kilo',
      category: 'vegetable',
      img: 'assets/images/carrots.jpg');
  Product vegitable5 = Product(
      name: 'Eggplant',
      price: 1.45,
      description: 'Byu per kilo',
      category: 'vegetable',
      img: 'assets/images/eggplant.jpg');

  Product diary1 = Product(
      name: 'Milk',
      price: 1,
      description: 'Byu per Liter',
      category: 'diary',
      img: 'assets/images/milk.png');
  Product diary2 = Product(
      name: 'Butter',
      price: 2.00,
      description: 'Byu per Piece',
      category: 'diary',
      img: 'assets/images/butter.jpg');
  Product diary3 = Product(
      name: 'Labaneh',
      price: 2.00,
      description: 'Byu per Piece',
      category: 'diary',
      img: 'assets/images/labneh.jpg');
  Product diary4 = Product(
      name: 'Labaneh Jarasheieh',
      price: 5.50,
      description: 'Byu per Kilo',
      category: 'diary',
      img: 'assets/images/labaneh2.jpg');
  Product diary5 = Product(
      name: 'Swiss Cheese',
      price: 0.50,
      description: 'Byu per Kilo YA BALASH',
      category: 'diary',
      img: 'assets/images/SwissCheese.jpg');

  void fill() {
    productsList.add(fruit1);
    productsList.add(fruit2);
    productsList.add(fruit3);
    productsList.add(fruit4);
    productsList.add(fruit5);

    productsList.add(vegitable1);
    productsList.add(vegitable2);
    productsList.add(vegitable3);
    productsList.add(vegitable4);
    productsList.add(vegitable5);

    productsList.add(diary1);
    productsList.add(diary2);
    productsList.add(diary3);
    productsList.add(diary4);
    productsList.add(diary5);
  }

  TextStyle st1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 20,
      color: Colors.black87);

  @override
  void initState() {
    super.initState();
    fill();
    CategoriesList.add(Product(name: 'fruit',img: 'assets/images/fruits.jpg'));
    CategoriesList.add(Product(name: 'vegetable',img: 'assets/images/vegetables.jpg'));
    CategoriesList.add(Product(name: 'diary',img: 'assets/images/diary.jpg'));

    Future<void> checkdatabase()async{
      productsMap = await helperUser.getAllProducts();
      print(productsMap);
      if(productsMap.length ==0 ) {
        productsList.forEach((e) {
          helperUser.addNewProduct(e);
        }
        );
      }
    }
    checkdatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Container(
          height: 240,
          child: ListView.builder(itemCount: CategoriesList.length,itemBuilder: (context, index) {
             return GestureDetector(
               onTap: () async {
                 getproductsFromDB = await helperUser.getProductsCategory(CategoriesList[index].name);
                 print(getproductsFromDB);
                 setState(() {
                 });
               },
               child: Card(
                 elevation: 20,
                 color: Colors.amber,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30),
                 ),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 15,
                     ),
                     Text(
                       CategoriesList[index].name,
                       style: st1,
                     ),
                     Container(
                         height: 140,
                         width: 120,
                         child: CircleAvatar(
                           backgroundImage: AssetImage(CategoriesList[index].img),
                         )),
                   ],
                 ),
               ),
             );
          },)
        ),
          Container(
          height: 390,
          child: ListView.builder(itemCount:getproductsFromDB.length ,itemBuilder:(context, index) {
            return Container(
                color: Colors.white,
                height:300,
                padding:EdgeInsets.only(top: 35,right: 10,left: 10,bottom: 10),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  runSpacing: 20,
                  //runAlignment: WrapAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Product p=Product(name: getproductsFromDB[index]['name'],price:getproductsFromDB[index]['price'],img: getproductsFromDB[index]['img'] );
                        Navigator.pushNamed(context, '/DetailsPage',arguments: p);
                        },
                      child: Card(
                        elevation: 20,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text('${getproductsFromDB[index]['name']}:${getproductsFromDB[index]['price']}'),
                                height: 120.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(getproductsFromDB[index]['img']),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }, ),
        )
      ]),
    );
  }
}
/*Card(
                elevation: 20,
                //color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Groceries '
                          'Categories',
                      style: st1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Scroll',
                      style: st1,
                    ),
                    Container(
                        height: 140,
                        width: 100,
                        child: Icon(
                          Icons.arrow_right_alt_sharp,
                          size: 100,
                        )),
                  ],
                ),
              ),*/