import 'package:eaglone/view/const.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Row subHeading(String heading) {
  return Row(
    children: [
      SizedBox(
        width: 25.w,
      ),
      Text(
        "$heading",
        style: GoogleFonts.karla(
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      ),
    ],
  );
}

Padding textField(
    {required String hint,
    required TextEditingController controller,
    required int len,
    // required var condition,
    required String? type,
    required TextInputType? keyboard}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
    child: TextFormField(
      keyboardType: keyboard,
      validator: (value) {
        if (value == null || value.length < len) {
          return "$type";
        }
      },
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: kblack, //
      decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: GoogleFonts.karla(
          textStyle: TextStyle(),
        ),
        focusColor: kblack,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}

bool obstext = false;
Padding ptextField(
    {required String hint,
    required TextEditingController controller,
    // required var condition,
    required String? type,
    required TextInputType? keyboard}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
    child: TextFormField(
      keyboardType: keyboard,

      obscureText: false,
      validator: (value) {
        if (value == null || value.length > 4) {
          return null;
        } else {
          return "Enter a passowrd of atleast 8 charcters ";
        }
      },
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: kblack, //
      decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: GoogleFonts.karla(
          textStyle: TextStyle(),
        ),
        focusColor: kblack,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}

final passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
final passwordValidator = RegExp(passwordRegex);
