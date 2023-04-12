import 'dart:developer';

import 'package:eaglone/Repositories/search.dart';
import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/produc_screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/product_search_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
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
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: Search.searchCourses(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset("assets/eaglone_loading.json"),
              ),
            );
          } else if (snapshot.hasData) {
            log(snapshot.data!.data.length.toString());
            return ListView.builder(
              itemCount: snapshot.data?.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductSearchScreen(
                              data: snapshot.data!, index: index),
                        ));
                  },
                  child: ListTile(
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
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset("assets/errorLottie.json"),
              ),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: appHeadings(content: "Search Your Course"));
  }
}
