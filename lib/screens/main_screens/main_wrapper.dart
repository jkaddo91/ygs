import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_got_served/screens/widgets/ygs_raised_button.dart';
import 'package:you_got_served/services/auth_service.dart';

class MainWrapper extends StatefulWidget {
  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  void _logout() {
    Provider.of<AuthService>(context, listen: false).logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YgsRaisedButton(
          text: 'Logout',
          onPressed: () {
            _logout();
          },
        ),
      ),
    );
  }
}
