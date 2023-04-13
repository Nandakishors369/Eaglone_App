import 'package:eaglone/Repositories/lessons.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/lesson_model.dart';
import 'package:eaglone/model/free_courses.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key, required this.video, required this.data});
  String video;
  LessonModel data;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;
  bool playst = true;
  void playVideo() {
    controller = VideoPlayerController.network(widget.video)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void initState() {
    // TODO: implement initState
    playVideo();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  "Video Screen",
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
          Container(
            width: double.infinity,
            height: 300,
            color: themeGreen.withOpacity(0.4),
            child: controller.value.isInitialized
                ? Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: VideoPlayer(controller),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20,
                          child: VideoProgressIndicator(controller,
                              allowScrubbing: true),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.fast_rewind)),
                          IconButton(
                              onPressed: () {
                                controller.seekTo(const Duration(seconds: 10));
                              },
                              icon: const Icon(Icons.replay_10)),
                          IconButton(
                              onPressed: () {
                                if (playst == true) {
                                  controller.pause();

                                  setState(() {
                                    playst = false;
                                  });
                                } else {
                                  controller.play();
                                  setState(() {
                                    playst = true;
                                  });
                                }
                              },
                              icon: playst
                                  ? const Icon(
                                      Icons.pause,
                                      size: 36,
                                    )
                                  : const Icon(
                                      Icons.play_arrow,
                                      size: 36,
                                    )),
                          IconButton(
                              onPressed: () {
                                controller.seekTo(const Duration(seconds: 10));
                              },
                              icon: const Icon(Icons.forward_10)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.fast_forward))
                        ],
                      )
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return newsCard(widget.data, index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: widget.data.data.length),
          )
        ],
      )),
    );
  }

  Padding newsCard(LessonModel data, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onTap: () {
          /*  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VideoScreen(),
              )); */
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
                ),
                kwidth15,
                Column(
                  children: [
                    kheigh20,
                    kheight10,
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        data.data[index].title,
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
