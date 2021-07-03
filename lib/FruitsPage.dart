import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/user.dart';

class fruitsPage extends StatefulWidget {
  @override
  _fruitsPageState createState() => _fruitsPageState();
}

class _fruitsPageState extends State<fruitsPage> {
  TextStyle st1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 20,
      color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

      child: ListView.builder(itemBuilder:(context, index) {
        return Container(
            height: 200,
            color: Colors.white,
            padding:EdgeInsets.only(top: 35,right: 10,left: 10,bottom: 10),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 20,
              runAlignment: WrapAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/DetailsPage');},
                  child: Card(
                    elevation: 20,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text('Name'),
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/Banana.jpg'),
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

