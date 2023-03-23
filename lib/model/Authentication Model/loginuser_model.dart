// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.err,
    this.token,
    required this.message,
  });

  bool err;
  String? token;
  String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        err: json["err"],
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "token": token,
        "message": message,
      };
}
