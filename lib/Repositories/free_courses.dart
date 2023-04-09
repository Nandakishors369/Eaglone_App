import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/Repositories/error.dart';
import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:http/http.dart' as http;

class FreeCourses {
  var freeProductModel;
  bool loaded = false;
  Future<FreeProductModel?> getProducts() async {
    log("Starting to fetch free courses");
    String url = "https://eaglone-api.onrender.com/free-courses";
    Map<String, String> headers = {
      "apikey":
          "bearer \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };
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
      } else {
        log("something went wrong while fetching products");
        errorHandler(statusCode: response.statusCode);
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
