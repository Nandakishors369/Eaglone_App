import 'package:eaglone/view/Domain%20Screen/playlist_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        foregroundColor: kblack,
        elevation: 0,
        title: appHeadings(content: "Intorduction"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheigh20,
              /* Row(
              children: [
                kwidth15,
                appHeadings(content: "Introduction"),
              ],
            ), */
              //kheigh20,
              details(),
              kheigh20,
              details(),
              kheigh20,
              details(),
              kheigh20,
              details(),
              kheigh20,
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Basic Instalation",
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
              ),
              kheigh20,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistScreen(title: "Flutter"),
                    ),
                  );
                },
                child: Container(
                  height: 60.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Go to Tutorials",
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
          ),
        ),
      ),
    );
  }

  Padding details() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Text(
        "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
