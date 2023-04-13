import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/order_history.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eaglone/view/api_keys.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryCourse {
  static Future<OrderHistory?> getCourses(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "$baseUrl/get-order/$userid";
    log(token.toString());
    log(userid);
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };
    log("its history");
    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);
    log("Fetching done");
    log(response.body);
    if (response.statusCode == 200) {
      log("fetched successfully");
      OrderHistory history = OrderHistory.fromJson(jsonDecode(response.body));
      return history;
    } else if (response.statusCode >= 401 && response.statusCode <= 403) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginUserScreen(),
          ),
          (route) => false);
      showSnackBar(context, "Please Login Again");
    } else {
      errorHandler(statusCode: response.statusCode);
    }
    /* log(response.statusCode.toString());
    log(response.statusCode.toString()); */
  }
}
