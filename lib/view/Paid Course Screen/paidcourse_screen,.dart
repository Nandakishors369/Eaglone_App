import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/Mongo%20Db/mongodb.dart';
import 'package:eaglone/model/mongo_model.dart';
import 'package:eaglone/model/product_model.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/const.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/produc_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PaidCourseScreen extends StatefulWidget {
  const PaidCourseScreen({super.key});

  @override
  State<PaidCourseScreen> createState() => _PaidCourseScreenState();
}

class _PaidCourseScreenState extends State<PaidCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheigh20,
              kheight10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          getMongo();
                        },
                        child: Icon(Iconsax.notification_bing)),
                    Text(
                      "EAGLONE",
                      style: GoogleFonts.montserrat(textStyle: shopHeading),
                    ),
                    ////insert data to mongo db example
                    GestureDetector(
                        onTap: () {
                          insertUser("Ruby", "799");
                        },
                        child: Icon(Iconsax.shopping_cart)),
                  ],
                ),
              ),
              kheigh20,
              kheight10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CupertinoSearchTextField(),
              ),
              kheigh20,
              CarouselSlider(
                items: [
                  Container(
                    height: 198.h,
                    width: 400.w,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: Color.fromARGB(255, 40, 40, 40),
                    ),
                  ),
                  Container(
                    height: 198.h,
                    width: 400.w,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: kblue,
                    ),
                  )
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              /* Container(
                height: 198.h,
                width: 400.w,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color.fromARGB(255, 40, 40, 40),
                ),
              ), */
              kheigh20,
              Row(
                children: [kwidth20, appHeadings(content: "Featured Courses")],
              ),
              kheigh20,
              kheight10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(),
                              ));
                        },
                        child: featuredCourses()),
                    featuredCourses()
                  ],
                ),
              ),
              kheigh20,
              kheigh20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [featuredCourses(), featuredCourses()],
                ),
              ),
              kheigh20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //kwidth20,
                    appHeadings(content: "All Courses"),
                    IconButton(
                        onPressed: () {}, icon: Icon(Iconsax.arrow_right_14))
                  ],
                ),
              ),
              kheigh20,
              kheight10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [featuredCourses(), featuredCourses()],
                ),
              ),
              kheigh20,
              kheigh20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [featuredCourses(), featuredCourses()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  featuredCourses() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: themeGreen)),
          height: 120.h,
          width: 190.w,
        ),
        Positioned(
          bottom: 70.h,
          child: Row(
            children: [
              kwidth15,
              Image.network(
                "https://www.vectorlogo.zone/logos/nodejs/nodejs-ar21.png",
                height: 80.h,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: FutureBuilder(
              future: getMongo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = MongoModel.fromJson(snapshot.data![1]);
                  return Text(
                    data.name,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Text(
            "599/-",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: kred, fontSize: 15.sp, fontWeight: FontWeight.w500)),
          ),
        )
      ],
    );
  }
}
