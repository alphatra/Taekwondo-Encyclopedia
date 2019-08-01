import 'package:flutter/material.dart';
import '../Navbar.dart';
import 'package:taekwondo_app/Controlersite.dart';
class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Navbar(magia: "Information",),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Container(color: Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}