import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/model/search_model.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final client = http.Client();

class PaidCourses {
  static Future<PaidCourseModel?> getCourses(BuildContext context) async {
    log("Starting to fetch paid courses");
    String url = "$baseUrl/paid-courses";
    Map<String, String> headers = {"apikey": "paidcourse $api_key"};
    String? query = null;
    final response = await client.get(Uri.parse(url), headers: headers);
    //log(response.body);
    if (response.statusCode == 200 && query != null) {
      PaidCourseModel courseModel =
          PaidCourseModel.fromJson(jsonDecode(response.body));
      List<Datum> data = courseModel.data
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      PaidCourseModel searchresult =
          PaidCourseModel(err: false, message: "search result", data: data);
      return searchresult;
    } else if (response.statusCode == 200 && query == null) {
      log('success');
      PaidCourseModel courseModel =
          PaidCourseModel.fromJson(jsonDecode(response.body));

      return courseModel;
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
      log("failed");
      throw Exception("Failed to fetch paid courses");
    }
  }
}
