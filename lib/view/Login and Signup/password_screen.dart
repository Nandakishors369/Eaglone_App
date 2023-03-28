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

  bool _obscureText = true;
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

        obscureText: _obscureText,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if (_obscureText == true) {
                  _obscureText = false;
                } else {
                  _obscureText = true;
                }
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
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
}
