import 'dart:developer';

import 'package:eaglone/Repositories/search.dart';
import 'package:eaglone/view/const.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return Center(child: Lottie.asset("assets/registered.json"));
          } else if (snapshot.hasData) {
            log(snapshot.data!.data.length.toString());
            return ListView.builder(
              itemCount: snapshot.data?.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kwhite,
                    backgroundImage:
                        NetworkImage(snapshot.data!.data[index].image),
                  ),
                  title: Text(
                    snapshot.data!.data[index].title,
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    snapshot.data!.data[index].category,
                    style: GoogleFonts.poppins(),
                  ),
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
