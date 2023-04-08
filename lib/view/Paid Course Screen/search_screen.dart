import 'dart:developer';

import 'package:eaglone/Repositories/search.dart';

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
        future: Search.searchCourses(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            log(snapshot.data!.data.length.toString());
            return ListView.builder(
              itemCount: snapshot.data?.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(snapshot.data!.data[index].image),
                  title: Text(snapshot.data!.data[index].title),
                  subtitle: Text(snapshot.data!.data[index].category),
                );
              },
            );
          } else {
            return Center(child: Text("data"));
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Text("No data"));
  }
}
