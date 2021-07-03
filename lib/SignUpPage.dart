import 'package:flutter/material.dart';
import 'package:quick_groceries/Model/user.dart';

import 'API/DBHelperUser.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextStyle st1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 30,
      color: Colors.black87);

  TextEditingController username_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController sex_controller = TextEditingController();
  TextEditingController age_controller = TextEditingController();
  int id = 1;
  List<Map<String, dynamic>> Data = [];
  DBHelperUser helper = DBHelperUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: st1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Kindly fill your data',
              style: st1,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Name'),
              controller: username_controller,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              controller: pass_controller,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Gender'),
              controller: sex_controller,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Age'),
              controller: age_controller,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      if(username_controller.text.isNotEmpty&&pass_controller.text.isNotEmpty&&age_controller.text.isNotEmpty&&sex_controller.text.isNotEmpty){
                        User user = User(
                            id: id,
                            name: username_controller.text,
                            password: pass_controller.text,
                            age: int.parse(age_controller.text.toString()),
                            gender: sex_controller.text
                        );
                        await helper.addNewUser(user);
                        Navigator.pushNamed(context, '/');
                      }
                      else{
                        String msg='Fill all the boxes';
                      }
                    },
                    child: Text('Create Account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
