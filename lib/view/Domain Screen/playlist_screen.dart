import 'package:eaglone/view/Home%20Screen/video_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({super.key, required this.title});
  String title;
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
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VideoScreen(),
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
                ),
                kwidth15,
                Column(
                  children: [
                    kheigh20,
                    kheight10,
                    Text(
                      "Video Name",
                      style: GoogleFonts.poppins(),
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
