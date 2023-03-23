import 'package:eaglone/services/youtube_services.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getvideolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheigh20,
            Row(
              children: [kwidth15, appHeadings(content: "Dart - Fundementals")],
            ),
            kheight10,
            kheigh20,
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return newsCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: 6)
          ],
        ),
      )),
    );
  }

  Padding newsCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SizedBox(
        width: 400.w,
        height: 150.h,
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              kwidth15,
              Container(
                color: themeGreen,
                height: 100.h,
                width: 150.w,
              ),
              kwidth15,
              Column(
                children: [
                  kheigh20,
                  kheight10,
                  Text(
                    "hello",
                    style: GoogleFonts.poppins(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
