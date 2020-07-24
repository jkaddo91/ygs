import 'package:flutter/material.dart';

class AuthWrapperViewModel extends ChangeNotifier {
  bool isSignIn = true;

  void toggleSignInSignUp() {
    isSignIn = !isSignIn;
  }
}
