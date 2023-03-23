import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Text appHeadings({required String content}) {
  return Text(
    "$content",
    style: GoogleFonts.poppins(
        textStyle: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600)),
  );
}

Text newsHeadings({required String content}) {
  return Text(
    "$content",
    style: GoogleFonts.poppins(
        textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600)),
    maxLines: 3,
  );
}
