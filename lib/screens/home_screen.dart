import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrance_final/screens/login_screen.dart';
import 'package:shared_prefrance_final/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  var _email;

  var _password;

  HomeScreen(this._email, this._password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1('Home Screen'),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'welcome ${_email}',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              'Your password is ${_password}',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('email');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
