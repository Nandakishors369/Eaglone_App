import 'package:eaglone/Repositories/history.dart';
import 'package:eaglone/Repositories/purchased_courses.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class EnrolledCourses extends StatefulWidget {
  const EnrolledCourses({super.key});

  @override
  State<EnrolledCourses> createState() => _EnrolledCoursesState();
}

class _EnrolledCoursesState extends State<EnrolledCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          kheigh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Iconsax.arrow_left)),
                Text(
                  "Course History",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
                Icon(
                  Iconsax.arrow_left,
                  color: kwhite,
                )
              ],
            ),
          ),
          kheigh20,
          kheigh20,
          FutureBuilder(
              future: Purchased.getCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: kwhite,
                          /* backgroundImage:
                                  NetworkImage(data.data[index].c), */
                        ),
                        title: Text(data.data[index].courses[index].course),
                      );
                    },
                  );
                } else {
                  return Lottie.asset("assets/not_found.json");
                }
              })
        ],
      )),
    );
  }
}
