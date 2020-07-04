import 'package:flutter/material.dart';
import 'package:you_got_served/screens/auth_screens/auth_wrapper.dart';
import 'package:you_got_served/screens/main_screens/main_wrapper.dart';
import 'package:you_got_served/services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Got Served',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: RootWrapper(),
    );
  }
}

class RootWrapper extends StatelessWidget {
  const RootWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthService().getCurrentUser();
    print(user);
    if (user == null) {
      return AuthWrapper();
    } else {
      return MainWrapper();
    }
  }
}
