import 'dart:developer';
import 'package:eaglone/Repositories/error.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/api_keys.dart';

class Purchased {
  static Future getCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url =
        "https://eaglone-api.onrender.com/get-purchased-courses?userId=$userid";
    log(token.toString());
    log(userid);
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };
    log("its happening");
    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);
    log("Fetching historyyyyyy");
    if (response.statusCode == 200) {
      log("fetched successfully");
    } else {
      errorHandler(statusCode: response.statusCode);
    }
    /* log(response.statusCode.toString());
    log(response.statusCode.toString()); */
  }
}
