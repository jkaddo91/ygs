import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_got_served/screens/widgets/ygs_raised_button.dart';
import 'package:you_got_served/screens/widgets/ygs_text_form_field.dart';
import 'package:you_got_served/view_models/auth_wrapper_vm.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String phoneNumber = '';
  String error = '';

  void _onPhoneFieldChange(val) {
    setState(() {
      phoneNumber = val;
    });
  }

  void _gotoSignInScreen() {
    Provider.of<AuthWrapperViewModel>(context, listen: false)
        .toggleSignInSignUp();
  }

  void _signupScreen() async {
    if (this._formKey.currentState.validate()) {
      dynamic result = 1; //await _authService.SignupScreenWithEmailAndPass();
      Navigator.pushNamed(context, '/verify-phone');
      if (result == null) {
        setState(() {
          this.error = result.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Billabong',
                        color: Colors.blueGrey[600]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    this.error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    softWrap: true,
                  ),
                  //Name Textfield
                  YgsTextFormField(
                    hintText: 'Phone number',
                    onChanged: _onPhoneFieldChange,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter phone number' : null,
                  ),
                  //Sign up Button
                  YgsRaisedButton(
                    text: 'Next',
                    onPressed: _signupScreen,
                  ),
                  //Sign up
                  FlatButton(
                    onPressed: () {
                      _gotoSignInScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account? ",
                            style: TextStyle(color: Colors.black54)),
                        Text(
                          "Sign in",
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
