import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/allcourse_model.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AllCourses {
  static Future getCourses() async {
    String url = "https://eaglone-api.onrender.com/courses?page=3&limit=3";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());

    Map<String, String> headers = {
      "apikey": "allcourse $api_key",
      "authorization": "allcourse $token"
    };
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      log(response.body);
      if (response.statusCode == 200) {
        log("All course fetched succesfully");
        Allcourse allcourse = Allcourse.fromJson(jsonDecode(response.body));
        return allcourse;
      } else {
        errorHandler(statusCode: response.statusCode);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
