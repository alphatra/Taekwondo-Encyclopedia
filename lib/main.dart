import 'package:flutter/material.dart';
import 'Controlersite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taekwondo',
      theme: ThemeData(
          fontFamily: 'Roboto',

      ),
      home: MyPage(),
    );
  }
}
