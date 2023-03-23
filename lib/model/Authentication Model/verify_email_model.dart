// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({
    this.auth,
    this.token,
    this.success,
    this.message,
  });

  bool? auth;
  String? token;
  bool? success;
  String? message;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        auth: json["auth"],
        token: json["token"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "success": success,
        "message": message,
      };
}
