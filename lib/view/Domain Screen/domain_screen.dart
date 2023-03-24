import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:eaglone/services/getdata.dart';
import 'package:eaglone/view/Domain%20Screen/details_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          child: Column(
        children: [
          kheigh20,
          Row(
            children: [
              kwidth15,
              appHeadings(content: "Flutter"),
            ],
          ),
          kheigh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
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
          Row(
            children: [],
          ),
          kheigh20,
          kheight10,
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              widget.data.data[widget.index].description,
              style: GoogleFonts.poppins(),
            ),
          )
        ],
      )),
    );
  }
}
