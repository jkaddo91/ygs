// import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_got_served/models/user.dart';

class AuthService {
  String _baseUrl = "https://portal.umat.edu.gh/devtools/fda/api";

  User getCurrentUser() {
    return null;
  }

  _signIn(String userName, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'UserName': userName, 'Password': password};
    var jsonResponse = null;
    var response = await http.post(_baseUrl, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        var token = jsonResponse['result']['auth_token'];
        sharedPreferences.setString("token", token);
        return token;
      }
    } else {
      print(response.body);
    }
  }

  Future<bool> signIn(String userName, String password) {
    try {
      _signIn(userName, password);
    } catch (e) {
      print("signIn: " + e.toString());
      return null;
    }
  }

  Future<void> logout() {
    try {} catch (e) {
      print("logout: " + e.toString());
      return null;
    }
  }

  Future<void> signUp() {
    try {} catch (e) {
      print("logout: " + e.toString());
      return null;
    }
  }
}
