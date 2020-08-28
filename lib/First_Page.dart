import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  static const routeName = "/firstpage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          "Rohit",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
