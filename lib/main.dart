import 'package:flutter/material.dart';
import 'package:movies/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Register(),
    );
  }
}
