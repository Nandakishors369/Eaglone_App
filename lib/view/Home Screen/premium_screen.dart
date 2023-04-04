import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appHeadings(content: "Explore All the Courses"),
              ],
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 100,
                    color: kblack,
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
