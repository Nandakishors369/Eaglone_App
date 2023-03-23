import 'dart:async';

import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/user_auth.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class SignUpUserScreen extends StatelessWidget {
  const SignUpUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NavigationBarScreen();
            } else {
              gotoHome(context);
              return Center(
                child: CupertinoActivityIndicator(
                  color: kblack,
                ),
              );
            }
          }),
    );
  }

  Future gotoHome(BuildContext context) async {
    Timer(const Duration(seconds: 4), (() {
      /* Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen())); */
    }));
  }
}
