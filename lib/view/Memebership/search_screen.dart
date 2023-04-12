import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Color> colors = [
    Color.fromARGB(255, 138, 231, 214), // 100% saturation, 90% brightness
    Color.fromARGB(255, 125, 230, 199), // 80% saturation, 80% brightness
    Color.fromARGB(255, 95, 216, 184), // 60% saturation, 70% brightness
    Color(0xFF5DC7A9), // 40% saturation, 60% brightness
    Color(0xFF3DA98D), // 20% saturation, 50% brightness
    Color(0xFF238E72), // 10% saturation, 40% brightness
  ];
  late int _colorIndex;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _colorIndex = 0;
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _colorIndex++;
        if (_colorIndex == colors.length) {
          _colorIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors[_colorIndex],
                  colors[(_colorIndex + 1) % colors.length]
                ],
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Eaglone Premium",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: kwhite),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
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
