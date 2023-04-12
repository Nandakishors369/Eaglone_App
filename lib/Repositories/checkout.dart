// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../view/api_keys.dart';

class Checkout {
  static bool orderPlaced = false;
  static Future placeOrder(
      {required String? transactionId, required BuildContext context}) async {
    String url = "$baseUrl/create-order";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    log(token.toString());
    log(userid);
    var headers = {"apikey": "cart $api_key", "authorization": "cart $token"};
    http.Response response;

    var body = {
      "user": userid,
      "client": "succeeded",
      "payment": {"method": "card", "transactionId": "dshjafkhjdfhjkdshjklsdf"},
      "coupon": {"code": "happy", "discount": 100}
    };
    log("started to place order");
    response = await http.post(Uri.parse(url), body: body, headers: headers);
    log(response.body);
    if (response.statusCode == 200) {
      log("Order Placed Successfully");
      orderPlaced = true;
      return "Order Placed";
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
    } else if (response.statusCode == 400) {
      log("Course is already purchased");
      return "Delete the course already purchased from the cart";
    } else {
      return errorHandler(statusCode: response.statusCode);
    }
  }
}
