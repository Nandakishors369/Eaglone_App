import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//colors
var kwhite = Colors.white;
var kblack = Colors.black;
var kblue = Colors.blue;
var kyellow = Color.fromRGBO(234, 212, 28, 1);
var kdgrey = Color.fromARGB(255, 58, 58, 58);
var kdblue = Color(0xFF2E6490);
var kred = Colors.red;
var kgrey = Color(0xFF90A4AE);
var themeGreen = Color(0xFF3BECB8);
//heights
var kheigh20 = SizedBox(height: 20.h);
var kheight10 = SizedBox(height: 10.h);
// widths
var kwidth10 = SizedBox(width: 10.w);
var kwidth15 = SizedBox(width: 15.w);
var kwidth20 = SizedBox(width: 20.w);
//others
String sampleText =
    "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";
final signupHeading = TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w700);

const MONGO_URL =
    "mongodb+srv://eaglone:eaglone@cluster0.tu1jvdt.mongodb.net/test";
const COLLECTION = "products";

Size size = Size(423.5, 941.2);
