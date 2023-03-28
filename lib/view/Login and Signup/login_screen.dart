import 'package:eaglone/services/user_authenticaton.dart';
import 'package:eaglone/view/Login%20and%20Signup/google_login.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserAuth userAuth = UserAuth();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              GlobalKey<FormState> lformGlobalKey = GlobalKey<FormState>();
              return Form(
                key: lformGlobalKey,
                child: Column(
                  children: [
                    Lottie.asset('assets/registered.json', height: 340.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kwidth20,
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(textStyle: signupHeading),
                        ),
                      ],
                    ),
                    kheight10,
                    subHeading("E-Mail"),
                    textField(
                        hint: "Enter Your Email",
                        controller: lemailController,
                        type: "Enter a valid email",
                        keyboard: TextInputType.emailAddress,
                        len: 5),
                    kheight10,
                    subHeading("Password"),
                    ptextField(
                      hint: "Enter Your Password",
                      controller: lpassController,
                      type: "Enter a proper Password",
                      keyboard: TextInputType.visiblePassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async {},
                          child: Text(
                            "Forgot Password ?",
                            style: GoogleFonts.karla(
                              //fontSize: 19.sp,
                              textStyle: TextStyle(color: themeGreen),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 270.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          final isValid =
                              lformGlobalKey.currentState!.validate();
                          if (isValid) {
                            setState(() {
                              _isLoading = true;
                            });
                            await loginUser(
                              email: lemailController.text,
                              password: lpassController.text,
                              context: context,
                            );
                            setState(() {
                              _isLoading = true;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: themeGreen),
                        child: _isLoading
                            ? CupertinoActivityIndicator()
                            : Text(
                                "Continue",
                                style: GoogleFonts.poppins(),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have An Account ?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ));
                            },
                            child: Text(
                              "Create Here",
                              style: GoogleFonts.karla(
                                textStyle: TextStyle(color: themeGreen),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      )),
    );
  }

  Future loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    status = true;
    var data = await userAuth.loginUser(email: email, password: password);
    if (userAuth.loginStatus == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(data),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    lemailController.clear();
    lpassController.clear();
    nameController.clear();
    /* .then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBarScreen(),
            ),
          ), */
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

TextEditingController lemailController = TextEditingController();
TextEditingController lpassController = TextEditingController();
late final tid;
var status;
