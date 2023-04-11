import 'dart:ui';

import 'package:eaglone/model/Authentication%20Model/signup_model.dart';
import 'package:eaglone/Repositories/user_authenticaton.dart';
import 'package:eaglone/view/Login%20and%20Signup/google_login.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/user_auth.dart';
import 'package:eaglone/view/Settings%20Screen/Settings%20menu/edit_profile.dart';
import 'package:eaglone/view/Settings%20Screen/Settings%20menu/profile_screen.dart';
import 'package:eaglone/view/Settings%20Screen/Settings%20menu/settingpop.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheigh20,
            Row(
              children: [
                kwidth15,
                appHeadings(content: "Settings"),
              ],
            ),
            kheigh20,
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditProfileScreen();
                    },
                  ));
                },
                child: headingss(heading: "Reset Password")),
            kheigh20,
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return settingmenupopup(
                          mdFilename: "termsandcondition.md");
                    },
                  );
                },
                child: headingss(heading: "Terms and Conditions")),
            kheigh20,
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return settingmenupopup(mdFilename: "privacy.md");
                    },
                  );
                },
                child: headingss(heading: "Privacy Policy")),
            kheigh20,
            headingss(heading: "Share the app"),
            kheigh20,
            GestureDetector(
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationIcon: Image.asset(
                        "assets/logo512.png",
                        height: 50,
                        width: 50,
                      ),
                      applicationName: "Eaglone",
                      applicationVersion: "1.0.0",
                      children: [
                        Text(
                          "Eaglone is a user-friendly tech learning platform developed by Nandakishor using Flutter. It offers personalized courses, tutorials, and resources on various tech topics, such as programming, web development, data science, and more. The courses are created by experts and include video lectures, quizzes, and hands-on projects. Eaglone also provides a community forum where learners can connect, collaborate, and ask questions.",
                          style: GoogleFonts.poppins(),
                        ),
                      ]);
                },
                child: headingss(heading: "About the app")),
            kheigh20,
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Confirmation"),
                        content: Text("Are you sure you want to logout ?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove("token");
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false);
                                /* googleSignIn.signOut();
                                FirebaseAuth.instance.signOut();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false); */
                              },
                              child: Text("Logout"))
                        ],
                      );
                    },
                  );
                },
                child: headingss(heading: "Logout")),
            /*  ElevatedButton(
                onPressed: () {
                  
                  //logoutUser(context: context);
                },
                child: Text("Logout")) */
          ],
        ),
      )),
    );
  }

  SizedBox headingss({required String heading, void Function()? onTap}) {
    return SizedBox(
      height: 70,
      width: 400,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kwidth15,
              Text(
                "$heading",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          elevation: 2,
        ),
      ),
    );
  }

  void logoutUser({required BuildContext context}) {
    // FirebaseAuthMethods(FirebaseAuth.instance).signout(context);
  }
}
