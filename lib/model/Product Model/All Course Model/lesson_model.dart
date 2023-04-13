// To parse this JSON data, do
//
//     final lessonModel = lessonModelFromJson(jsonString);

import 'dart:convert';

LessonModel lessonModelFromJson(String str) =>
    LessonModel.fromJson(json.decode(str));

String lessonModelToJson(LessonModel data) => json.encode(data.toJson());

class LessonModel {
  LessonModel({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.lessonId,
    required this.course,
    required this.title,
    required this.tutorName,
    required this.v,
  });

  String id;
  String lessonId;
  String course;
  String title;
  String tutorName;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        lessonId: json["lessonId"],
        course: json["course"],
        title: json["title"],
        tutorName: json["tutorName"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "lessonId": lessonId,
        "course": course,
        "title": title,
        "tutorName": tutorName,
        "__v": v,
      };
}
