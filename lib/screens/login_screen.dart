import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrance_final/shared/constants.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar1('Login'),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Email please';
                    }
                    return null;
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder()),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  obscureText: visible,
                  validator: (value) {
                    if (value!.isEmpty || value.length <= 3) {
                      return '*confirm you have entered your password \n*At leest 4 characters';
                    }
                    return null;
                  },
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hoverColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      suffixIconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visible ? visible = false : visible = true;
                            });
                          },
                          icon: visible
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )),
                      border: OutlineInputBorder()),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setData();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(email.text, password.text),
                            ));

                      }
                    },
                    child: Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email.text);
    preferences.setString('password', password.text);
  }
}
