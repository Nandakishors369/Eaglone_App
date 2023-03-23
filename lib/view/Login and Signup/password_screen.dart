import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

TextEditingController rpassController = TextEditingController();
TextEditingController rcpassController = TextEditingController();

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Column(
        children: [
          kheight10,
          Lottie.asset('assets/Comp 1.json', height: 340.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kwidth20,
              Text(
                "Reset\nYour Password",
                style: GoogleFonts.poppins(textStyle: signupHeading),
              ),
            ],
          ),
          kheight10,
          subHeading("New Password"),
          ptextField(
            hint: "Enter Your Password",
            controller: passwordController,
            type: "Enter a proper Password",
            keyboard: TextInputType.visiblePassword,
          ),
          kheight10,
          subHeading("Confirm Password"),
          ptextField(
            hint: "Enter Your Password",
            controller: passwordController,
            type: "Enter a proper Password",
            keyboard: TextInputType.visiblePassword,
          ),
          kheight10,
          kheight10,
          kheight10,
          SizedBox(
            width: 270.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: themeGreen),
              child: Text(
                "Continue",
                style: GoogleFonts.poppins(),
              ),
            ),
          )
        ],
      ),
    ])));
  }
}
