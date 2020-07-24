// import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_got_served/app_constants.dart';

enum AuthenticationStatus {
  Unauthenticated,
  Authenticating,
  Authenticated,
}

class AuthService extends ChangeNotifier {
  AuthenticationStatus status = AuthenticationStatus.Unauthenticated;

  String _baseUrl = "https://portal.umat.edu.gh/devtools/fda/api/";

  Future authenticated() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(AppConstants().tokenKey);
    var response = await http
        .get(_baseUrl + "Account/GetUserProfile", headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token
    });
    if (response.statusCode == 200) {
      status = AuthenticationStatus.Authenticated;
      notifyListeners();
    }
  }

  Future signIn(String userName, String password) async {
    try {
      status = AuthenticationStatus.Authenticating;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      dynamic jsonResponse;
      var response = await http.post(_baseUrl + "Account/login",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{"UserName": userName, "Password": password}));

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          var token = jsonResponse['result']['auth_token'];
          sharedPreferences.setString(AppConstants().tokenKey, token);
          status = AuthenticationStatus.Authenticated;
        }
      } else {
        status = AuthenticationStatus.Unauthenticated;
      }
      print("Error: (signIn) " + response.body);
    } catch (e) {
      print("Error: (signIn) " + e.toString());
      status = AuthenticationStatus.Unauthenticated;
    }
    notifyListeners();
  }

  Future logout() async {
    try {
      status = AuthenticationStatus.Unauthenticated;
      notifyListeners();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove(AppConstants().tokenKey);
      print(sharedPreferences.getString(AppConstants().tokenKey));
    } catch (e) {
      print("logout: " + e.toString());
      return null;
    }
  }

  Future<void> signUp() {
    try {
      return null;
    } catch (e) {
      print("logout: " + e.toString());
      return null;
    }
  }
}
