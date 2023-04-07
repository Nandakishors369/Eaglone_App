import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/model/search_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();

class PaidCourses {
  static Future<PaidCourseModel> getCourses([String? query]) async {
    log("Starting to fetch paid courses");
    String url = "https://eaglone-api.onrender.com/paid-courses";
    Map<String, String> headers = {
      "apikey":
          "paidcourse \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    log(response.body);
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
    } else {
      log("failed");
      throw Exception("Failed to fetch paid courses");
    }
  }
}
