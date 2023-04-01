import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:http/http.dart' as http;

class PaidCourses {
  Future<PaidCourseModel?> getCourses() async {
    log("Starting to fetch paid courses");
    String url = "https://eaglone-api.onrender.com/paid-courses";
    Map<String, String> headers = {
      "apikey":
          "paidcourse \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };
    http.Response response;
    try {
      response = await http.get(Uri.parse(url), headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        log('success');
        PaidCourseModel courseModel =
            PaidCourseModel.fromJson(jsonDecode(response.body));
        return courseModel;
      } else {
        log("failed");
        throw Exception("Failed to fetch paid courses");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
