import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  static const routeName = "/signup";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String userName = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 30.0),
              buildTextField("userName"),
              SizedBox(height: 25.0),
              buildTextField("password"),
              SizedBox(
                height: 80.0,
              ),
              buildButtonContaner(),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(LoginPage());
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      onChanged: (value) => {hintText = value},
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:
            hintText == "Name" ? Icon(Icons.person_outline) : Icon(Icons.email),
      ),
    );
  }

  Widget buildButtonContaner() {
    return InkWell(
      onTap: () {
        signup(userName, password);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.redAccent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Text(
            "SIGNUP",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  signup(username, password) {
    var response = createUser(username, password);
    response.then((value) => debugPrint(value.body));
  }

  Future<http.Response> createUser(username, password) {
    return http.post(
      'https://fakerestapi.azurewebsites.net/api/Users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'UserName': username, 'Password': password}),
    );
  }
}
