import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/model/Authentication%20Model/loginuser_model.dart';
import 'package:eaglone/model/Authentication%20Model/signup_data.dart';
import 'package:eaglone/view/api_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var tokenLog;

class UserAuth {
  bool verified = false;
  bool otpTrue = false;
  bool status = false;
  bool gotToken = false;
  bool loginStatus = false;

  Future<SignupResponse?> signup(
      {required String name,
      required String email,
      required String mobile,
      required String password}) async {
    String Url = "$baseUrl/user-signup";
    try {
      final body = {
        "email": email,
        "password": password,
        "mobile": mobile,
        "name": name
      };
      Map<String, String> headers = {"apikey": "bearer $api_key"};
      final url = Uri.parse(Url);
      http.Response response;
      log("Signup Started");
      response = await http.post(url, body: body, headers: headers);
      log(response.body);

      if (response.statusCode == 200) {
        log("worked");
        status = true;

        SignupResponse signupResponse =
            SignupResponse.fromJson(jsonDecode(response.body));

        return signupResponse;
      } else {
        status = false;
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      // throw Exception();
    }
  }

  Future verifyOtp({required String email, required String otp}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String verifyUrl = "$baseUrl/verify-email";
    final url = Uri.parse(verifyUrl);
    final body = {"email": email, "otp": otp};

    Map<String, String> headers = {"apikey": "verifyOtp $api_key"};
    try {
      http.Response response;
      response = await http.post(url, body: body, headers: headers);

      log("otp worked");
      log(response.body);
      if (response.statusCode == 200) {
        verified = true;

        var data = jsonDecode(response.body);

        prefs.setString("token", data['token']);

        otpTrue = true;
        log(response.body);
      } else {
        verified = false;
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      verified = false;
      log(e.toString());
      //throw Exception();
    }
  }

  Future loginUser({required String email, required String password}) async {
    String Url = "$baseUrl/user-login";
    Map<String, String> headers = {"apikey": "loginUser $api_key"};
    var body = {"email": email, "password": password};
    http.Response response;
    log("login started");
    try {
      response = await http.post(Uri.parse(Url), body: body, headers: headers);
      //log(response.body);
      var data = jsonDecode(response.body);
      // LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        loginStatus = true;
        log("Login success");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", data['token']); //storing the token
      } else if (response.statusCode == 400) {
        log(data['message']);
        return "This user has been deleted by the admin";
      } else if (response.statusCode == 400) {
        log(data['message']);
        return "You dont have a account";
      } else if (response.statusCode == 401) {
        log(data['message']);
        //also some fatal error may occur
        return "Entered credentials is wrong !";
      } else if (response.statusCode == 500) {
        log(data['message']);
        return "Something went wrong , Please Try Again";
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
