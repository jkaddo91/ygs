import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Got Served',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeScreen(),
    );
  }
}
