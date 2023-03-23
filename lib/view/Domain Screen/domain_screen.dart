import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  const DomainScreen({super.key});

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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dart",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: kblue,
                            fontWeight: FontWeight.w600,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                      Image.asset(
                          "assets/355-3557482_flutter-logo-png-transparent-png-removebg-preview (1).png")
                    ],
                  ),
                ),
                height: 168.h,
                width: 400.w,
                decoration: BoxDecoration(
                  border: Border.all(color: kblue),
                  color: kwhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              "$sampleText",
              style: GoogleFonts.poppins(),
            ),
          ),
          kheigh20,
          kheigh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flutter",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                    Image.asset(
                        "assets/355-3557482_flutter-logo-png-transparent-png-removebg-preview (1).png")
                  ],
                ),
              ),
              height: 168.h,
              width: 400.w,
              decoration: BoxDecoration(
                border: Border.all(color: kblue),
                color: kwhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              "$sampleText",
              style: GoogleFonts.poppins(),
            ),
          )
        ],
      )),
    );
  }
}
