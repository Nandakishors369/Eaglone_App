import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/Cart%20Model/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart {
  Future addtoCart(
      {required String courseid,
      required String userid,
      required String token}) async {
    log("adding to cart");

    String url = "https://eaglone-api.onrender.com/add-to-cart";
    Map<String, String> headers = {
      "apikey":
          "cart \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi",
      "authorization": "cart $token"
    };

    var body = {"courseId": courseid, "userId": userid};
    http.Response response;

    try {
      response = await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        log("added to cart succesfully");
      } else if (response.statusCode == 400) {
        log(response.statusCode.toString());
        log("not added to cart");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<CartModel?> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "https://eaglone-api.onrender.com/get-cart?userId=$userid";
    Map<String, String> headers = {
      "apikey":
          "cart \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi",
      "authorization": "cart $token"
    };

    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      log("fetched cart ");
      CartModel cart = CartModel.fromJson(jsonDecode(response.body));
      return cart;
    } else {
      log("something went wrong while fetching the cart ${response.statusCode}");
      return null;
    }
  }
}
