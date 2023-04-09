// To parse this JSON data, do
//
//     final freeProductModel = freeProductModelFromJson(jsonString);

import 'dart:convert';

FreeProductModel freeProductModelFromJson(String str) =>
    FreeProductModel.fromJson(json.decode(str));

String freeProductModelToJson(FreeProductModel data) =>
    json.encode(data.toJson());

class FreeProductModel {
  FreeProductModel({
    required this.err,
    required this.message,
    required this.data,
  });

  bool err;
  String message;
  List<Datum> data;

  factory FreeProductModel.fromJson(Map<String, dynamic> json) =>
      FreeProductModel(
        err: json["err"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.courseId,
    required this.image,
    required this.description,
    required this.classes,
    required this.views,
    required this.category,
    required this.premium,
    required this.v,
    this.rating,
  });

  String id;
  String title;
  String courseId;
  String image;
  String description;
  int classes;
  int views;
  String category;
  bool premium;
  int v;
  int? rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        courseId: json["courseId"],
        image: json["image"],
        description: json["description"],
        classes: json["classes"],
        views: json["views"],
        category: json["category"],
        premium: json["premium"],
        v: json["__v"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "courseId": courseId,
        "image": image,
        "description": description,
        "classes": classes,
        "views": views,
        "category": category,
        "premium": premium,
        "__v": v,
        "rating": rating,
      };
}
