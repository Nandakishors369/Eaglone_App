import 'dart:developer';
//import 'dart:html';

import 'dart:ui';
import 'package:eaglone/model/Product%20Model/freecourse_model.dart';
import 'package:eaglone/Repositories/free_courses.dart';
import 'package:eaglone/view/Home%20Screen/course_history.dart';
import 'package:eaglone/view/Home%20Screen/your_courses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/Mongo%20Db/mongodb.dart';
import 'package:eaglone/model/free_courses.dart';

import 'package:eaglone/Repositories/getdata.dart';
import 'package:eaglone/Repositories/news_services.dart';
import 'package:eaglone/Repositories/user_authenticaton.dart';
import 'package:lottie/lottie.dart';
import 'package:eaglone/view/Domain%20Screen/domain_screen.dart';
import 'package:eaglone/view/Domain%20Search/Dsearch_screen.dart';
import 'package:eaglone/view/Home%20Screen/premium_screen.dart';
import 'package:eaglone/view/Home%20Screen/widgets.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/const.dart';
import 'package:eaglone/view/Settings%20Screen/Settings%20menu/profile_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FreeCourses freeCourses = FreeCourses();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        body: SlidingUpPanel(
          backdropEnabled: true,
          color: Colors.transparent,
          minHeight: 335.h,
          maxHeight: 470.h,
          panel: Container(
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(20.r)),
            child: FutureBuilder(
              future: freeCourses.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Lottie.asset("assets/vTSLp13quf.json", height: 200)

                      /* Text(
                      "Getting your courses..!",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: kblack,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp,
                        ),
                      ),
                    ), */
                      );
                } else if (snapshot.hasData && snapshot.data != null) {
                  FreeProductModel data = snapshot.data!;
                  return Column(
                    children: [
                      kheight10,
                      DragIndicator(),
                      kheigh20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            stacks(context,
                                name: data.data[0].title,
                                color: kblue,
                                data: data,
                                index: 0),
                            stacks(context,
                                name: data.data[1].title,
                                color: kyellow,
                                data: data,
                                index: 1)
                          ],
                        ),
                      ),
                      kheigh20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            stacks(context,
                                name: data.data[2].title,
                                color: kdgrey,
                                data: data,
                                index: 2),
                            stacks(context,
                                name: data.data[3].title,
                                color: kdblue,
                                data: data,
                                index: 3)
                          ],
                        ),
                      ),
                      kheigh20,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DSearchScreen(),
                              ));
                        },
                        child: Container(
                          height: 60.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                              color: themeGreen,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Explore All Courses",
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
                      )
                    ],
                  );
                } else {
                  return Text("Something Went Wrong");
                }
              },
            ),
          ),
          body: HomeBody(),
        ));
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

dynamic userData;
String? userName;

class _HomeBodyState extends State<HomeBody> {
  void initState() {
    /*  userData = FirebaseAuth.instance.currentUser!;
    nameCheck();
    
  }

  void nameCheck() {
    if (userData.displayName == null) {
      userName = "User";
    } else {
      userName = userData.displayName;
    } */
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        kheigh20,
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "EAGLONE",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        letterSpacing: 5,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
              ),
              GestureDetector(
                onTap: () async {
                  FreeCourses freeCourses = FreeCourses();
                  await freeCourses.getProducts();
                  /*   SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.getString("token");
                  log(prefs.getString("token").toString()); */
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
                child: CircleAvatar(
                  backgroundColor: themeGreen,
                  backgroundImage:
                      AssetImage("assets/NicePng_avatar-png_8049853.png"),
                  radius: 25.r,
                ),
              )
            ],
          ),
        ),
        kheigh20,
        Row(
          children: [
            kwidth15,
            appHeadings(content: "Good Morning Learner"),
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
                    builder: (context) => PremiumScreen(),
                  ));
            },
            child: Container(
              height: 168.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: themeGreen,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FutureBuilder<Object>(
                      future: null,
                      builder: (context, snapshot) {
                        return Text(
                          "Explore All \nCourses",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 30.sp,
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ),
        kheigh20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kwidth10,
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnrolledCourses(),
                      ));
                },
                child: nothingButton("Course \nHistory")),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YourCourses(),
                      ));
                },
                child: nothingButton("Your \nCourses")),
            kwidth10,
          ],
        ),
        kheigh20,
        Row(
          children: [
            kwidth15,
            appHeadings(content: "Start Learning Now"),
          ],
        )
      ],
    ));
  }

//-----------------------------------------------------Widgets--------------------------------------------------------
  Container nothingButton(String name) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 148.h,
      width: 190.w,
      decoration: BoxDecoration(
          color: kwhite,
          border: Border.all(color: themeGreen, width: 2),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "$name",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: themeGreen,
                fontWeight: FontWeight.w600,
                fontSize: 30.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector stacks(BuildContext context,
    {required String name,
    required Color color,
    required FreeProductModel data,
    required int index}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DomainScreen(
              data: data,
              index: index,
            ),
          ));
    },
    child: OpenContainer(
      closedBuilder: (_, openContainer) {
        return Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.r)),
          height: 124.h,
          width: 190.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "$name",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: kwhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      openColor: color,
      // closedElevation: 50.0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      closedColor: Colors.white,
      openBuilder: (_, closeContainer) {
        return DomainScreen(
          data: data,
          index: index,
        ); /* Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Go back'),
                leading: IconButton(
                  onPressed: closeContainer,
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ); */
      },
    ),
  );
}

class DragIndicator extends StatelessWidget {
  const DragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 3.h,
      width: 40.w,
    );
  }
}


// Container(
//       decoration: BoxDecoration(
//           color: color, borderRadius: BorderRadius.circular(10.r)),
//       height: 124.h,
//       width: 190.w,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Text(
//             "$name",
//             style: GoogleFonts.poppins(
//               textStyle: TextStyle(
//                 color: kwhite,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 35.sp,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),