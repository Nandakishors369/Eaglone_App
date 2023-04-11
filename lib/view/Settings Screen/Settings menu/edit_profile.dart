import 'package:eaglone/Repositories/password.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _cpassController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    bool status;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheigh20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Iconsax.arrow_left)),
                    Text(
                      "Reset Password",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    ),
                    Icon(
                      Iconsax.arrow_left,
                      color: kwhite,
                    )
                  ],
                ),
              ),
              kheigh20,
              kheigh20,
              Text(
                'Password',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: _obscureText,
                controller: _passController,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  filled: true,
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
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: _obscureText,
                controller: _cpassController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  filled: true,
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
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    status = await Password.resetPass(
                        password: cpasswordController.text, context: context);
                  },
                  child: Text('Change Password'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
