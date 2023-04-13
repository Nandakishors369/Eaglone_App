import 'dart:developer';

import 'package:eaglone/Repositories/enroll.dart';
import 'package:eaglone/Repositories/lessons.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/lesson_model.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/video_model.dart';
import 'package:eaglone/view/Home%20Screen/video_screen.dart';
import 'package:eaglone/view/Home%20Screen/your_courses.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen(
      {super.key,
      required this.title,
      required this.courseId2,
      required this.img});
  String title;
  String courseId2;
  String img;
  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  void initState() {
    super.initState();
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
              children: [kwidth15, appHeadings(content: widget.title)],
            ),
            kheight10,
            kheigh20,
            FutureBuilder(
                future: Lesson.getLessson(widget.courseId2, context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingGrid();
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return newsCard(
                              img: widget.img,
                              courseId: snapshot.data!.data[index].id,
                              title: snapshot.data!.data[index].title,
                              datas: snapshot.data!);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: snapshot.data!.data.length);
                  } else {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                })
          ],
        ),
      )),
    );
  }

  Padding newsCard(
      {required String img,
      required String title,
      required String courseId,
      required LessonModel datas}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onTap: () async {
          log("video started");
          VideoModel? data = await FreeCoursesEnroll.getVideo(
              courseId: courseId, context: context);
          log("video next page");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VideoScreen(video: data!.data, data: datas),
              ));
        },
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
                  child: Image.network(img),
                ),
                kwidth15,
                Column(
                  children: [
                    kheigh20,
                    kheight10,
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
