import 'dart:developer';

import 'package:http/http.dart' as http;

class Cart {
  Future addtoCart() async {
    log("adding to cart");
    String url = "https://eaglone-api.onrender.com/add-to-cart";
    Map<String, String> headers = {
      "apikey":
          "cart \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };

    var body = {
      "courseId": "641d236d36de7ccd8350a99d",
      "userId": "640fe4d726eddc730305b61c"
    };
    http.Response response;

    try {
      response = await http.post(Uri.parse(url), headers: headers, body: body);
    } catch (e) {}
  }
}
