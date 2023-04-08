import 'package:eaglone/Repositories/all_courses.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/allcourse_model.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/allcourse_screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/produc_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
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
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoSearchTextField(),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 35.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: themeGreen,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  },
                ),
              ),
            ),
            /*   SizedBox(
                  height: 200.h,
                ),
                Lottie.asset("assets/not_found.json") */
            FutureBuilder(
                future: AllCourses.getCourses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CupertinoActivityIndicator();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: data!.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: courseGrid(
                                data: data,
                                index: index,
                                price:
                                    data.data[index].price.toString() == "null"
                                        ? "Free"
                                        : data.data[index].price.toString()));
                      },
                    );
                  } else {
                    return Text("Something Went Wrong");
                  }
                })
          ],
        ),
      )),
    );
  }

  courseGrid(
      {required AllCoursePageModel data,
      required int index,
      required String price}) {
    return GestureDetector(
      onTap: () {
        /*  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(data: data, index: index),
            )); */
      },
      child: Container(
        height: 208.h,
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
                price,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: kred,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
