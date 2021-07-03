import 'package:flutter/material.dart';
import 'package:quick_groceries/Model/user.dart';

import 'API/DBHelperUser.dart';

class basket extends StatefulWidget {
  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {

  DBHelperUser helper =DBHelperUser();
  List<Map<String, dynamic>> getbasket = [];
  getdatafromDB()async{
  getbasket = await helper.getBasket();
  }
  @override
  void initState() {
    super.initState();
    getdatafromDB();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(itemCount:getbasket.length ,itemBuilder:(context, index) {
        return Container(
            color: Colors.white,
            height:150,
            padding:EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 6,
              runSpacing: 6,
              //runAlignment: WrapAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    elevation: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text('${getbasket[index]['name']}:${getbasket[index]['price']}'),
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(getbasket[index]['img']),
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
    );
  }
}








//
// return Container(
// height: 240,
// padding: EdgeInsets.all(10),
// child: Container(
// height: 100,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: [
// Card(
// elevation: 20,
// //color: Colors.amber,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(0),
// ),
// child: Column(
// children: [
// SizedBox(
// height: 15,
// ),
// Text(
// 'Groceries '
// 'Categories',
// style: st1,
// ),
// SizedBox(height: 10,),
// Text('Scroll',style: st1,),
// Container(
// height: 140,
// width: 100,
// child: Icon(
// Icons.arrow_right_alt_sharp,
// size: 100,
// )),
// ],
// ),
// ),
// GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, '/FruitsPage');
// },
// child: Card(
// elevation: 20,
// color: Colors.amber,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
// ),
// child: Column(
// children: [
// SizedBox(
// height: 15,
// ),
// Text(
// 'Fruits',
// style: st1,
// ),
// Container(
// height: 140,
// width: 120,
// child: CircleAvatar(
// backgroundImage: AssetImage('assets/images/fruits.jpg'),
// )),
// ],
// ),
// ),
// ),
// Card(
// elevation: 20,
// color: Colors.amber,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// child: Column(
// children: [
// SizedBox(
// height: 15,
// ),
// Text(
// 'Vegetables',
// style: st1,
// ),
// Container(
// height: 140,
// width: 120,
// child: CircleAvatar(
// backgroundImage:
// AssetImage('assets/images/vegetables.jpg'),
// )),
// ],
// ),
// ),
// Card(
// elevation: 20,
// color: Colors.amber,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// child: Column(
// children: [
// SizedBox(
// height: 15,
// ),
// Text(
// 'Diary',
// style: st1,
// ),
// Container(
// height: 140,
// width: 120,
// child: CircleAvatar(
// backgroundImage:
// AssetImage('assets/images/diary.jpg'),
// )),
// ],
// ),
// ),
//
// ],
// ),
//
// ),
// );
// }
// }