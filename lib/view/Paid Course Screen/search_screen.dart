import 'dart:developer';

import 'package:eaglone/Repositories/paid_courses.dart';
import 'package:flutter/material.dart';

class SearchPaid extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: PaidCourses.getCourses(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            log(snapshot.data!.data.length.toString());
            return ListView.builder(
              itemCount: snapshot.data?.data.length,
              itemBuilder: (context, index) {
                ListTile(
                  title: Text(snapshot.data!.data[index].title),
                );
              },
            );
          } else {
            return Text("data");
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("No data");
  }
}
