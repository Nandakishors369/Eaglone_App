import 'dart:ui';

import 'package:eaglone/model/Cart%20Model/cart_model.dart';
import 'package:eaglone/services/cart.dart';
import 'package:eaglone/view/Payment%20and%20Confirmation/payment_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marquee/marquee.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart cart = Cart();
  int total = 0;
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
          Expanded(
            child: FutureBuilder(
                future: cart.getCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CupertinoActivityIndicator();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data!;

                    return ListView.builder(
                      itemCount: data.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cartItems(data: data, index: index);
                      },
                    );
                  } else {
                    return Text("Something Went Wrong");
                  }
                }),
          ),
          /*  SizedBox(
            height: 320.h,
          ), */
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
                FutureBuilder(
                    future: cart.getCart(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          "0/-",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: themeGreen,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        var data = snapshot.data!;
                        int price = 0;
                        for (int i = 0; i < data.data.length; i++) {
                          price = price + data.data[i].ourPrice;
                        }
                        return Text(
                          "$price/-",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: themeGreen,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                        );
                      } else {
                        return Text(
                          "price/-",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: themeGreen,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                        );
                      }
                    }),
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
          ),
          kheight10
        ],
      )),
    );
  }

  Padding cartItems({required CartModel data, required int index}) {
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
                      data.data[index].title,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 15.sp)),
                    )
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
