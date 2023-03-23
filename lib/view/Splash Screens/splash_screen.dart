import 'dart:async';

import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    gotoHome(context);
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash 5000.png"),
      ),
    );
  }

  Future gotoHome(BuildContext context) async {
    Timer(
      const Duration(seconds: 3),
      (() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginUserScreen() //LoginUserScreen(),
              ),
        );
      }),
    );
  }
}
