import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:http/http.dart' as http;

class FreeCourses {
  Future<FreeProductModel?> getProducts() async {
    String url = "https://eaglone-api.onrender.com/free-courses";
    Map<String, String> headers = {
      "apikey":
          "bearer \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };
    http.Response response;
    try {
      log("fetching free products");
      response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        log("fetched products");

        FreeProductModel freeProductModel =
            FreeProductModel.fromJson(jsonDecode(response.body));
        log(freeProductModel.message);
        return freeProductModel;
      } else {
        log("something went wrong while fetching products");
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
