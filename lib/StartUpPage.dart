import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'API/DBHelperUser.dart';

class StartUpPage extends StatefulWidget {
  @override
  _StartUpPage createState() => _StartUpPage();
}

class _StartUpPage extends State<StartUpPage> {
  TextStyle st1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 30,
      color: Colors.black87);

  ButtonStyle stButton = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red))));

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DBHelperUser helper =DBHelperUser();
  List<Map<String, dynamic>> getUserFromDB = [];
  String ErrorMsg ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Groceries'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue[200],
          //BACKGROUND IMG//////////////////////////////////////////////////////////////////
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage : AssetImage('assets/images/logo.jpg'),//NetworkImage('https://images.app.goo.gl/EybX7NAi2p6cky7J6'),
                radius: 120,

              ),
              login(context),
              SizedBox(height: 50),
              signUp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    return Column(
      children: [
        Text(
          'Have an Account?',
          style: st1,
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'User Name'),
          controller: userNameController,
          //controller: age_controller,
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Password'),
          controller: passwordController,
          //controller: age_controller,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: ()async {
            if(userNameController.text.isNotEmpty&&passwordController.text.isNotEmpty){
              getUserFromDB = await helper.CheckUser(userNameController.text, passwordController.text);
              print('TESSST ${getUserFromDB.length}');
              print('TESSST ${userNameController.text}');
              print('TESSST ${passwordController.text}');
              if(getUserFromDB.isNotEmpty){
                Navigator.pushNamed(context, '/HomePage');
              }
              else{
                setState(() {
                  ErrorMsg='User name or password entered is incorrect ';
                });
              }
            }
          },
          child: Text(
            'Login',
          ),
          // style: stButton,
        )
      ],
    );
  }

  Widget signUp(BuildContext context) {
    return Column(
      children: [
        Text(
          'Do not have an Account?',
          style: st1,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/SignUpPage');
          },
          child: Text(
            'SignUp',
          ),
          // style: stButton,
        )
      ],
    );
  }
}
