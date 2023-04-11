import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/Repositories/free_courses.dart';
import 'package:eaglone/Repositories/paid_courses.dart';
import 'package:eaglone/view/Home%20Screen/your_courses.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class AllCourse extends StatefulWidget {
  AllCourse({super.key, required this.search});
  bool search;
  @override
  State<AllCourse> createState() => _AllCourseState();
}

class _AllCourseState extends State<AllCourse> {
  PaidCourses course = PaidCourses();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.search == true) {
      Future.delayed(Duration.zero, () => focusNode.requestFocus());
    }
    return;
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                          child: const Icon(Iconsax.arrow_left)),
                      Text(
                        "All Courses",
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCourse(search: true),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 35,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: kblack.withOpacity(0.5),
                          ),
                          kwidth5,
                          Text("Search",
                              style: TextStyle(
                                  fontFamily: 'San Francisco',
                                  fontSize: 17,
                                  color: kblack.withOpacity(0.5)))
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: kblack.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                kheight10,
                kheigh20,
                FutureBuilder(
                    future: PaidCourses.getCourses(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return allCourseLoading();
                      } else if (snapshot.hasData && snapshot.data != null) {
                        var data = snapshot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 190 / 208,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            return allCourses(data, index);
                          },
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset("assets/Main.json"),
                          ),
                        );
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
    height: 108.h,
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
                height: 100.h, fit: BoxFit.contain),
          ),
          kheight10,
          Text(
            data.data[index].category,
            maxLines: 1,
            style: GoogleFonts.poppins(fontSize: 15.sp, color: themeGreen),
          ),
          //kheight5,
          Text(
            data.data[index].title,
            maxLines: 1,
            style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),

          Text(
            "599/-",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: kred, fontSize: 17.sp, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ),
  );
}
