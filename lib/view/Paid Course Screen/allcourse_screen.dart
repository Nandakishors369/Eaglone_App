import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/services/free_courses.dart';
import 'package:eaglone/services/paid_courses.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCourse extends StatelessWidget {
  AllCourse({super.key});
  PaidCourses course = PaidCourses();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: appHeadings(content: "All Courses")),
                kheight10,
                CupertinoSearchTextField(),
                kheight10,
                FutureBuilder(
                    future: course.getCourses(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CupertinoActivityIndicator());
                      } else if (snapshot.hasData && snapshot.data != null) {
                        var data = snapshot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 708,
                              child: Container(
                                height: 708,
                                width: 190.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: themeGreen)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.network(
                                            data.data[index].image,
                                            height: 100,
                                            fit: BoxFit.contain),
                                      ),
                                      kheight10,
                                      Text(
                                        data.data[index].category,
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15, color: themeGreen),
                                      ),
                                      //kheight5,
                                      Text(
                                        data.data[index].title,
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      /*   Text(
                                        "599",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: kred,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500)),
                                      ), */
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

allCourses(PaidCourseModel data, int index) {
  return Container(
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
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            "599",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: kred, fontSize: 17, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ),
  );
}
