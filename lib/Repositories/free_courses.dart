import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FreeCourses {
  var freeProductModel;
  bool loaded = false;

  Future<FreeProductModel?> getProducts(BuildContext context) async {
    log("Starting to fetch free courses");
    String url = "$baseUrl/free-courses";
    Map<String, String> headers = {"apikey": "bearer $api_key"};
    http.Response response;

    try {
      log("Started fetching free products");
      response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        log("fetched products");

        freeProductModel = FreeProductModel.fromJson(jsonDecode(response.body));
        log(freeProductModel.message);
        loaded = true;
        return freeProductModel;
      } else if (response.statusCode >= 401 && response.statusCode <= 403) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var clear = prefs.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginUserScreen(),
            ),
            (route) => false);
        showSnackBar(context, "Please Login Again");
      } else {
        log("something went wrong while fetching products ${response.statusCode}");
        errorHandler(statusCode: response.statusCode);
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
