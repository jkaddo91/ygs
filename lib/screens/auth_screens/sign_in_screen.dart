import 'package:flutter/material.dart';
import 'package:you_got_served/screens/widgets/ygs_password_form_field.dart';
import 'package:you_got_served/screens/widgets/ygs_raised_button.dart';
import 'package:you_got_served/screens/widgets/ygs_text_form_field.dart';
import 'package:you_got_served/services/auth_service.dart';

class SignInScreen extends StatefulWidget {
  final Function gotoSignUpScreen;

  SignInScreen({@required this.gotoSignUpScreen});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
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

  void _logIn(BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      await _authService.signIn(userName, password);
    }
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
                    onPressed: () async {
                      _logIn(context);
                    },
                  ),
                  //Sign up
                  FlatButton(
                    onPressed: () {
                      widget.gotoSignUpScreen();
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
