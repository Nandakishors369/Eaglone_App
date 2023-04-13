import 'package:eaglone/Repositories/history.dart';
import 'package:eaglone/Repositories/purchased_courses.dart';
import 'package:eaglone/view/Home%20Screen/your_courses.dart';
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
          child: SingleChildScrollView(
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
                future: Purchased.getCourses(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingGrid();
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (context, index) {
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset("assets/errorLottie.json"),
                    );
                  }
                })
          ],
        ),
      )),
    );
  }
}
