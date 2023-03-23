import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:eaglone/services/news_services.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://192.168.64.140:3000/test";

Future signUp() async {
  log("helloo");
  final headers = {
    "apiKey":
        "bearer \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
  };
  final url = Uri.parse("http://192.168.64.140:3000/user-signup");
  var body = {
    "email": "nandakishormisc@gmail.com",
    "password": "12345",
    "mobile": "9074973331",
    "name": "ajmla junaid"
  };
  http.Response response;
  response = await http.post(url, headers: headers, body: body);
  log("called$response");
  log(response.body);
  if (response.statusCode == 200) {
    // log("Worked");
    log(response.body);
  } else {
    //log("not worked");
    log(response.statusCode.toString());
  }
}
 

/* signUp() async {
  log("hello");
  var request = http.Request('GET', Uri.parse('http://localhost:3000/test'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
 */

/* Future getsample() async {
  log("hello");
  try {
    http.Response response;
    var url = Uri.parse("http://192.168.64.140:3000/admin/categories");
    response = await http.get(url);
    log(response.body);
    // log(response.statusCode.toString());
    /*  if (response.statusCode == 200) {
      log(" workingg");
      log(response.body);
      /* sample data = sample.fromJson(jsonDecode(response.body)); */
    } else {
      log("not working ");
      throw Exception();
    } */
  } catch (e) {
    log(e.toString());
    throw Exception();
  }
} */
