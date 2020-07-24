import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_got_served/screens/auth_screens/auth_wrapper.dart';
import 'package:you_got_served/screens/main_screens/main_wrapper.dart';
import 'package:you_got_served/services/auth_service.dart';
import 'package:you_got_served/view_models/auth_wrapper_vm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthService(),
        child: MaterialApp(
          title: 'You Got Served',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: SafeArea(child: RootWrapper()),
        ));
  }
}

class RootWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        if (authService.status == AuthenticationStatus.Unauthenticated) {
          return ChangeNotifierProvider(
              create: (context) => AuthWrapperViewModel(),
              child: AuthWrapper());
        }
        if (authService.status == AuthenticationStatus.Authenticated) {
          return MainWrapper();
        }
        return CircularProgressIndicator();
      },
      child: Container(),
    );
  }
}
