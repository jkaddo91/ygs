import 'package:flutter/material.dart';
import 'package:you_got_served/screens/auth_screens/sign_in_screen.dart';
import 'package:you_got_served/screens/auth_screens/sign_up_screen.dart';

class AuthWrapper extends StatefulWidget {
  AuthWrapper({Key key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool showSignIn = true;
  void _toggleView() {
    setState(() => this.showSignIn = !this.showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (this.showSignIn) {
      return SignInScreen(gotoSignUpScreen: _toggleView);
    } else {
      return SignUpScreen(gotoSignInScreen: _toggleView);
    }
  }
}
