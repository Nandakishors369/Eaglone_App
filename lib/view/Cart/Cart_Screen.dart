import 'dart:ui';

import 'package:eaglone/model/Cart%20Model/cart_model.dart';
import 'package:eaglone/services/cart.dart';
import 'package:eaglone/view/Payment%20and%20Confirmation/payment_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
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
                  "Order Details",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
                Icon(Icons.delete_outline),
              ],
            ),
          ),
          kheigh20,
          kheight10,
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 15, 10),
            child: Row(
              children: [
                appHeadings(content: "My Cart"),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: cart.getCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CupertinoActivityIndicator();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data!;

                    return ListView.separated(
                      itemCount: data.data.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(
                          endIndent: 15,
                          indent: 15,
                          thickness: 0.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return cartItems(data: data, index: index);
                      },
                    );
                  } else {
                    return Text("Please add products");
                  }
                }),
          ),
          /*  SizedBox(
            height: 320.h,
          ), */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
                future: cart.getCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      "Fetching your cart",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: themeGreen,
                              fontSize: 25,
                              fontWeight: FontWeight.w500)),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data!;
                    int price = 0;
                    int discount = 0;
                    int total = 0;
                    for (int i = 0; i < data.data.length; i++) {
                      price = price + data.data[i].price;
                      discount =
                          discount + data.data[i].price - data.data[i].ourPrice;
                      total = total + data.data[i].ourPrice;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight5,
                        Text(
                          "Order Info",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$price/-",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$discount/-",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ("$total/-"),
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
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
          ),
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
              height: 50.h,
              width: 375.w,
              decoration: BoxDecoration(
                  color: themeGreen, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Place Order",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          kheigh20
        ],
      )),
    );
  }

  Padding cartItems({required CartModel data, required int index}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: GestureDetector(
        onLongPress: () {},
        child: SizedBox(
            width: 400.w,
            height: 150.h,
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: themeGreen,
                      borderRadius: BorderRadius.circular(10)),
                ),
                kwidth15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight10,
                    Text(
                      data.data[index].title,
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      data.data[index].category,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                    //kheigh20,
                    kheight10,
                    Row(
                      children: [
                        Text(
                          "${data.data[index].price}",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        kwidth100,
                        /*  kwidth20,
                        kwidth20,
                        kwidth10, */
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                )
              ],
            ) /* Card(
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
                      data /*  data.data[index].title */,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 15.sp)),
                    )
                  ],
                ),
              ],
            ),
          ), */
            ),
      ),
    );
  }
}

/* 
FutureBuilder(
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
                    return Text("Please add products");
                  }
                }), */




/* Row(
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
            ), */