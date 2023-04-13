import 'package:eaglone/Repositories/history.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class YourCourses extends StatefulWidget {
  const YourCourses({super.key});

  @override
  State<YourCourses> createState() => _YourCoursesState();
}

class _YourCoursesState extends State<YourCourses> {
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
                    "Your Courses",
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
                future: HistoryCourse.getCourses(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingGrid();
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data.length,
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
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Lottie.asset("assets/errorLottie.json"),
                        ),
                      ],
                    );
                  }
                })
          ],
        ),
      )),
    );
  }
}

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 208.h,
              width: 190.w,
              decoration: BoxDecoration(
                  color: kblack, borderRadius: BorderRadius.circular(10)),
            );
          },
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
