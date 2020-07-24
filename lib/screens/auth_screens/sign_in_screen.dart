import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_got_served/screens/widgets/ygs_password_form_field.dart';
import 'package:you_got_served/screens/widgets/ygs_raised_button.dart';
import 'package:you_got_served/screens/widgets/ygs_text_form_field.dart';
import 'package:you_got_served/services/auth_service.dart';
import 'package:you_got_served/view_models/auth_wrapper_vm.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String password = '';
  String error = '';

  void _onUserNameFieldChange(val) {
    setState(() {
      this.userName = val;
    });
  }

  void _onPasswordFieldChange(val) {
    setState(() {
      this.password = val;
    });
  }

  void _logIn() {
    if (_formKey.currentState.validate()) {
      Provider.of<AuthService>(context, listen: false)
          .signIn(userName, password);
    }
  }

  void _gotoSignUpScreen() {
    Provider.of<AuthWrapperViewModel>(context, listen: false)
        .toggleSignInSignUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text('You Got Served',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Billabong',
                          color: Colors.blueGrey[600])),
                  SizedBox(
                    height: 20,
                  ),
                  //Error Msg
                  Text(
                    this.error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    softWrap: true,
                  ),
                  //UserName Textfield
                  YgsTextFormField(
                    hintText: 'Username',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _onUserNameFieldChange,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your username' : null,
                  ),
                  //Password TxtField
                  YgsPasswordFormField(
                    hintText: 'Password',
                    onChanged: _onPasswordFieldChange,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter password' : null,
                  ),
                  //logIn Button
                  YgsRaisedButton(
                    text: 'Log In',
                    onPressed: () {
                      _logIn();
                    },
                  ),
                  //Sign up
                  FlatButton(
                    onPressed: () {
                      _gotoSignUpScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                            style: TextStyle(color: Colors.black54)),
                        Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
