import 'dart:developer';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eaglone/view/api_keys.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Password {
  static Future<bool> resetPass(
      {required String password, required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "https://eaglone-api.onrender.com/reset-password";
    log(token.toString());
    log(userid);
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };
    var body = {
      "tokenValue":
          "ac9bde3edc82eaaec22a488768afd48dcb9fdec37422b20a1a932487c5edacd8",
      "newPassword": "ajmal"
    };
    http.Response response;
    response = await http.post(Uri.parse(url), body: body, headers: headers);
    log(response.body);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginUserScreen(),
          ),
          (route) => false);
      showSnackBar(context, "Please Login With Your New Password");
      return true;
    } else {
      log("something went wrong");
      return false;
    }
  }
}
