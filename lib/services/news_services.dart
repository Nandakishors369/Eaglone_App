// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/model/post.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:http/http.dart' as http;

Future<newsModel?> getNews() async {
  try {
    http.Response response;
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=programming&sortBy=relevancy&apiKey=$news_api");

    response = await http.get(url);

    if (response.statusCode == 200) {
      newsModel news = newsModel.fromJson(json.decode(response.body));
      log("hi");
      return news;
    } else if (response.statusCode == 429) {
      log("to many requests made ");
    } else {
      log("not working");
      throw Exception();
    }
  } catch (e) {
    log(e.toString());
    throw Exception();
  }
}

/* Future<sample?> getsample() async {
  try {
    http.Response response;
    var url = Uri.parse("http://192.168.66.136:3000/nandu");
    response = await http.get(url);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log(" workingg");
      log(response.body);
      sample data = sample.fromJson(jsonDecode(response.body));
      return data;
    } else {
      log("not working ");
      throw Exception();
    }
  } catch (e) {
    log(e.toString());
    throw Exception();
  }
} */

class sample {
  String? message;

  sample({required this.message});

  sample.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
