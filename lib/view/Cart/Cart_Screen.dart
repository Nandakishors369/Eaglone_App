import 'dart:ui';

import 'package:eaglone/view/Payment%20and%20Confirmation/payment_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          kheigh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Iconsax.arrow_left),
                Text(
                  "Cart",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
                Icon(Icons.delete_outline),
              ],
            ),
          ),
          kheigh20,
          kheigh20,
          cartItems(),
          kheight10,
          cartItems(),
          SizedBox(
            height: 320.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                Text(
                  "499/-",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: themeGreen,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          kheigh20,
          kheigh20,
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ));
            },
            child: Container(
              height: 60.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: themeGreen, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Place Order",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Padding cartItems() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onLongPress: () {},
        child: SizedBox(
          width: 400.w,
          height: 150.h,
          child: Card(
            elevation: 10,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/355-3557482_flutter-logo-png-transparent-png-removebg-preview (1).png"))),
                  height: 100.h,
                  width: 150.w,
                ),
                kwidth15,
                Column(
                  children: [
                    kheigh20,
                    kheight10,
                    Text(
                      "Product Details",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 20.sp)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
