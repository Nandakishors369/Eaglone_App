// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Cart%20Model/cart_model.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  static Future addtoCart(
      {required String courseid,
      required String userid,
      required String token,
      required BuildContext context}) async {
    log("adding to cart");

    String url = "$baseUrl/add-to-cart";
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };

    var body = {"courseId": courseid, "userId": userid};
    http.Response response;

    try {
      response = await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        log("Product Added to Cart");
        return "Product Added to Cart";
      } else if (response.statusCode == 400) {
        log("product already in cart");
        return "Product Already in the cart";
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
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<CartModel?> getCart(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "$baseUrl/get-cart?userId=$userid";
    log("token");
    log(token.toString());
    log(userid);
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };

    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);

    log(response.body);
    if (response.statusCode == 200) {
      log("fetched cart ");
      CartModel cart = CartModel.fromJson(jsonDecode(response.body));
      //log(response.body);
      return cart;
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
      log("something went wrong");
      errorHandler(statusCode: response.statusCode);
    }
  }

  static Future deleteCart(
      {required String courseid, required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "$baseUrl/remove-from-cart";
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };

    var body = {"courseId": courseid, "userId": userid};
    http.Response response;

    try {
      response = await http.post(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200) {
        log("Item removed from cart");
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
        log("something went wrong");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
