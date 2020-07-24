import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/dashboard.dart';

import 'package:upajVirasat/Screens/welcome.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example Dialogflow Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
     home: new MainPage(),
    );
  }
}
