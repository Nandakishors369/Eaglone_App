import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/Mongo%20Db/mongodb.dart';
import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/model/mongo_model.dart';
import 'package:eaglone/model/product_model.dart';
import 'package:eaglone/services/paid_courses.dart';
import 'package:eaglone/view/Cart/Cart_Screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/allcourse_screen.dart';
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
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaidCourseScreen extends StatefulWidget {
  const PaidCourseScreen({super.key});

  @override
  State<PaidCourseScreen> createState() => _PaidCourseScreenState();
}

class _PaidCourseScreenState extends State<PaidCourseScreen> {
  PaidCourses paid = PaidCourses();
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
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var token = prefs.get('token');
                          Map<String, dynamic> decodedToken =
                              JwtDecoder.decode(token.toString());
                          log(decodedToken.toString());
                        },
                        child: Icon(Iconsax.notification_bing)),
                    Text(
                      "EAGLONE",
                      style: GoogleFonts.montserrat(textStyle: shopHeading),
                    ),
                    ////insert data to mongo db example
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ));
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/jSWwKABiFik-HD.jpg",
                        fit: BoxFit.cover,
                      ),
                    ), /* Card(
                      elevation: 5,
                      child: Image.asset(
                        "assets/jSWwKABiFik-HD.jpg",
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ), */
                  ),
                  Container(
                    height: 198.h,
                    width: 400.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/M3ni_jDqY6E-HD.jpg",
                        fit: BoxFit.cover,
                      ),
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
              kheigh20,
              Row(
                children: [kwidth20, appHeadings(content: "Featured Courses")],
              ),
              kheigh20,
              kheight10,
              FutureBuilder(
                  future: paid.getCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: appHeadings(content: "Fetching you courses"));
                    } else if (snapshot.hasData && snapshot.data != null) {
                      var data = snapshot.data!;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                featuredCourses(data, 0),
                                featuredCourses(data, 1)
                              ],
                            ),
                          ),
                          kheigh20,
                          kheigh20,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                featuredCourses(data, 2),
                                featuredCourses(data, 3)
                              ],
                            ),
                          ),
                          kheigh20,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllCourse(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //kwidth20,
                                  appHeadings(content: "All Courses"),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Iconsax.arrow_right_14))
                                ],
                              ),
                            ),
                          ),
                          kheigh20,
                          kheight10,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                featuredCourses(data, 1),
                                featuredCourses(data, 0)
                              ],
                            ),
                          ),
                          kheigh20,
                          kheigh20,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                featuredCourses(data, 2),
                                featuredCourses(data, 3)
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return appHeadings(
                          content: "Failed to fetch the courses");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  featuredCourses(PaidCourseModel data, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(data: data, index: index),
            ));
      },
      child: Container(
        height: 208,
        width: 190.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: themeGreen)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(data.data[index].image,
                    height: 100, fit: BoxFit.contain),
              ),
              kheight10,
              Text(
                data.data[index].category,
                maxLines: 1,
                style: GoogleFonts.poppins(fontSize: 15, color: themeGreen),
              ),
              //kheight5,
              Text(
                data.data[index].title,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "599",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: kred,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
