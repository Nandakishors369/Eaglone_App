import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/allcourse_model.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AllCourses {
  static Future<AllCoursePageModel?> getCourses() async {
    int count = 3;
    int limit = 3;
    String url =
        "https://eaglone-api.onrender.com/courses?page=$count&limit=$limit";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());

    Map<String, String> headers = {
      "apikey": "allcourse $api_key",
      "authorization": "allcourse $token"
    };

    log("all courses staretedd");
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    log(response.body);
    if (response.statusCode == 200) {
      log("All course fetched succesfully");

      AllCoursePageModel allcourse =
          AllCoursePageModel.fromJson(jsonDecode(response.body));
      return allcourse;
    } else {
      errorHandler(statusCode: response.statusCode);
    }
  }
}
