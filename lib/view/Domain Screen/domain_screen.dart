import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:eaglone/Repositories/getdata.dart';
import 'package:eaglone/view/Domain%20Screen/details_screen.dart';
import 'package:eaglone/view/Domain%20Screen/playlist_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DomainScreen extends StatefulWidget {
  DomainScreen({super.key, required this.data, required this.index});
  FreeProductModel data;
  int index;
  @override
  State<DomainScreen> createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    kwidth15,
                    appHeadings(content: "Flutter"),
                  ],
                ),
                kheigh20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 268.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: themeGreen),
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Image.network(widget.data.data[widget.index].image),
                  ),
                ),
                kheigh20,
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    widget.data.data[widget.index].title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: kblack,
                        fontWeight: FontWeight.w500,
                        fontSize: 35.sp,
                      ),
                    ),
                  ),
                ),
                kheight10,
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          kwidth5,
                          Text(
                            "1.6k",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: kdgrey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                kheigh20,
                kheight10,
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    widget.data.data[widget.index].description,
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistScreen(
                          title: widget.data.data[widget.index].title),
                    ));
              },
              child: Container(
                height: 60.h,
                width: 400.w,
                decoration: BoxDecoration(
                  color: themeGreen,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Go to Tutorials",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
