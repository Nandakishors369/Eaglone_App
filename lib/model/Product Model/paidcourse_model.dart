// To parse this JSON data, do
//
//     final paidCourseModel = paidCourseModelFromJson(jsonString);

import 'dart:convert';

PaidCourseModel paidCourseModelFromJson(String str) =>
    PaidCourseModel.fromJson(json.decode(str));

String paidCourseModelToJson(PaidCourseModel data) =>
    json.encode(data.toJson());

class PaidCourseModel {
  PaidCourseModel({
    required this.err,
    required this.message,
    required this.data,
  });

  bool err;
  String message;
  List<Datum> data;

  factory PaidCourseModel.fromJson(Map<String, dynamic> json) =>
      PaidCourseModel(
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
    required this.price,
    required this.percentage,
    required this.ourPrice,
    required this.category,
    required this.premium,
    this.rating,
    required this.v,
  });

  String id;
  String title;
  String courseId;
  String image;
  String description;
  int classes;
  int views;
  int price;
  int percentage;
  int ourPrice;
  String category;
  bool premium;
  int? rating;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        courseId: json["courseId"],
        image: json["image"],
        description: json["description"],
        classes: json["classes"],
        views: json["views"],
        price: json["price"],
        percentage: json["percentage"],
        ourPrice: json["ourPrice"],
        category: json["category"],
        premium: json["premium"],
        rating: json["rating"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "courseId": courseId,
        "image": image,
        "description": description,
        "classes": classes,
        "views": views,
        "price": price,
        "percentage": percentage,
        "ourPrice": ourPrice,
        "category": category,
        "premium": premium,
        "rating": rating,
        "__v": v,
      };
}
