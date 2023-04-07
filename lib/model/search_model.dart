// To parse this JSON data, do
//
//     final searchCourse = searchCourseFromJson(jsonString);

import 'dart:convert';

List<SearchCourse> searchCourseFromJson(String str) => List<SearchCourse>.from(
    json.decode(str).map((x) => SearchCourse.fromJson(x)));

String searchCourseToJson(List<SearchCourse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchCourse {
  SearchCourse({
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
    required this.rating,
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
  int rating;
  int v;

  factory SearchCourse.fromJson(Map<String, dynamic> json) => SearchCourse(
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
