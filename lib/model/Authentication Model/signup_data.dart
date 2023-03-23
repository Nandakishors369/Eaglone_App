// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({
    required this.success,
    required this.message,
    required this.newUser,
  });

  bool success;
  String message;
  NewUser newUser;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        success: json["success"],
        message: json["message"],
        newUser: NewUser.fromJson(json["newUser"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "newUser": newUser.toJson(),
      };
}

class NewUser {
  NewUser({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.active,
    required this.otp,
    required this.id,
    required this.v,
  });

  String name;
  String email;
  String mobile;
  String password;
  bool active;
  String otp;
  String id;
  int v;

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        active: json["active"],
        otp: json["otp"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "active": active,
        "otp": otp,
        "_id": id,
        "__v": v,
      };
}
