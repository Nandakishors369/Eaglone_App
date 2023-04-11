import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

//colors
var kwhite = Colors.white;
var kblack = Colors.black;
var kblue = Colors.blue;
var kyellow = Color.fromRGBO(234, 212, 28, 1);
var kdgrey = Color.fromARGB(255, 58, 58, 58);
var kdblue = Color(0xFF2E6490);
var kred = Colors.red;
var kgrey = Color(0xFF90A4AE);
var themeGreen = Color(0xFF3BECB8);

//heights
var kheigh20 = SizedBox(height: 20.h);
var kheight10 = SizedBox(height: 10.h);
var kheight5 = SizedBox(height: 5.h);
var kheight40 = SizedBox(height: 40.h);
var kheight100 = SizedBox(
  height: 100.h,
);
// widths
var kwidth5 = SizedBox(width: 5.w);
var kwidth10 = SizedBox(width: 10.w);
var kwidth15 = SizedBox(width: 15.w);
var kwidth20 = SizedBox(width: 20.w);
var kwidth100 = SizedBox(width: 100.w);

//others
String sampleText =
    "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";
final signupHeading = TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w700);

const MONGO_URL =
    "mongodb+srv://eaglone:eaglone@cluster0.tu1jvdt.mongodb.net/test";
const COLLECTION = "products";

Size size = const Size(423.5, 941.1);

//loading

class allCourseLoading extends StatelessWidget {
  const allCourseLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 100.h,
              width: 190.w,
              decoration: BoxDecoration(
                color: kblack,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            );
          },
        ));
  }
}

var loadinPaidCourse = Shimmer.fromColors(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [loadingFeatured(), loadingFeatured()],
        ),
      ),
      kheigh20,
      kheigh20,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [loadingFeatured(), loadingFeatured()],
        ),
      ),
      kheigh20,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //kwidth20,
              Container(
                decoration: BoxDecoration(
                    color: kblack, borderRadius: BorderRadius.circular(20)),
                height: 20,
                width: 60,
              ),
              Container(
                height: 20.h,
                width: 60,
                decoration: BoxDecoration(
                    color: kblack, borderRadius: BorderRadius.circular(20)),
              )
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
          children: [loadingFeatured(), loadingFeatured()],
        ),
      ),
      kheigh20,
      kheigh20,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [loadingFeatured(), loadingFeatured()],
        ),
      ),
    ],
  ),
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
);

loadingFeatured() {
  return GestureDetector(
    child: Container(
      height: 208,
      width: 190.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kblack,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    ),
  );
}

var hell = Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      kheight5,
      /*  Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kblack,
        ),
      ), */
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kblack,
              ),
              height: 20,
              width: 60,
            ),
          ),
        ],
      ),
      kheigh20,
      Center(
        child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 50.h,
              width: 375.w,
              decoration: BoxDecoration(
                  color: kblack, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
      kheigh20
    ],
  ),
);
