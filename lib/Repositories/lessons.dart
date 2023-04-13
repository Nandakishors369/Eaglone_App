import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/lesson_model.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/video_model.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eaglone/view/api_keys.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lesson {
  static Future<LessonModel?> getLessson(
      String courseId2, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    String userid = decodedToken['_id'];
    String url = "$baseUrl//get-lessons-pcourse/$courseId2";
    log("token");
    log(token.toString());
    log(userid);
    Map<String, String> headers = {
      "apikey": "cart $api_key",
      "authorization": "cart $token"
    };
    //Map<String, String> body = {"courseId": courseId2, "userId": userid};

    http.Response response;
    response = await http.get(Uri.parse(url), headers: headers);
    log(response.body);
    if (response.statusCode == 200) {
      log("workeddd");
      LessonModel lessonModel = LessonModel.fromJson(jsonDecode(response.body));
      return lessonModel;
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
}
