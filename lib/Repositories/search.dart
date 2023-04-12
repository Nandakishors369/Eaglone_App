import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/search_model.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Search {
  static Future<SearchModel?> searchCourses({required String query}) async {
    String url = "$baseUrl/search/$query";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());

    Map<String, String> headers = {
      "apikey": "allcourse $api_key",
      "authorization": "allcourse $token"
    };
    log("Searching Started");
    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);
    log("result awaiting");
    log(response.body);
    if (response.statusCode == 200) {
      log("Got Search results");
      SearchModel model = SearchModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      errorHandler(statusCode: response.statusCode);
    }
  }
}
