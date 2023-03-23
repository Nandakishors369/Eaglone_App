// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:eaglone/services/user_authenticaton.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  String email;
  //VoidCallback onPressed;
  //var otp;
  OtpScreen({
    super.key,
    required this.email,
    //required this.onPressed,
  });
  final UserAuth userAuth = UserAuth();
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("assets/105173-verification-code-otp.json"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kwidth20,
                Text(
                  "Enter OTP",
                  style: GoogleFonts.poppins(textStyle: signupHeading),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  Text(
                    'A four digit OTP has been sent to \nyour phone number',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 15.sp)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 40.w,
              style: TextStyle(fontSize: 17.sp),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async {
                await userAuth.verifyOtp(email: email, otp: pin);
                if (userAuth.verified == true) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationBarScreen(),
                      ),
                      (route) => false);
                } else if (userAuth.verified == false) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Failed"),
                        content: Text("Verification failed please try again"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok"))
                        ],
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {
                /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginUserScreen(),
                    )); */
              },
              child: Text(
                "Resend OTP",
                style: GoogleFonts.karla(
                  textStyle: TextStyle(fontSize: 17.sp, color: themeGreen),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
