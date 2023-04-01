import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/free_courses.dart';
import 'package:eaglone/model/product_model.dart';

/* Stream<List<ProductModel>> getUsers() => FirebaseFirestore.instance
    .collection('freeCourses')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());
 */

Stream<List<PlaylistModel>> getCourses() {
  final data = FirebaseFirestore.instance
      .collection('freeCourses')
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((doc) => PlaylistModel.fromJson(doc.data()))
          .toList());
  log(data.toString());
  return data;
}
