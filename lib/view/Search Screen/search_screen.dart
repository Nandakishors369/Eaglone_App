import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeGreen,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Premium Screen",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: kwhite)),
            ),
          )
        ],
      )),
    );
  }
}

// kheigh20,
//           appHeadings(content: "Search Your Question"),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: CupertinoSearchTextField(),
//           ),
//           SizedBox(
//             height: 200.h,
//           ),
//           Lottie.asset("assets/22.json")
