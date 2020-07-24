import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_got_served/screens/auth_screens/sign_in_screen.dart';
import 'package:you_got_served/screens/auth_screens/sign_up_screen.dart';
import 'package:you_got_served/view_models/auth_wrapper_vm.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthWrapperViewModel>(builder: (context, authWrapper, _) {
      if (authWrapper.isSignIn) {
        return SignInScreen();
      }
      return SignUpScreen();
    });
  }
}
