// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eaglone/main.dart';
import 'package:eaglone/model/Product%20Model/All%20Course%20Model/search_model.dart';
import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/Repositories/cart.dart';
import 'package:eaglone/view/Cart/Cart_Screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/const.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductSearchScreen extends StatefulWidget {
  ProductSearchScreen({super.key, required this.data, required this.index});
  SearchModel data;
  int index;
  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  bool isloading = false;
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
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Iconsax.arrow_left)),
                Text(
                  "Product Details",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ));
                  },
                  icon: Icon(Iconsax.shopping_cart),
                )
              ],
            ),
          ),
          kheigh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ImageSlideshow(height: 400.h, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.data.data[widget.index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.data.data[widget.index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.data.data[widget.index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          ),
          kheigh20,
          Row(
            children: [
              kwidth15,
              Text(
                widget.data.data[widget.index].title,
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          kheigh20,
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              widget.data.data[widget.index].description,
              style: GoogleFonts.poppins(),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          kheigh20,
          //kheight10,
          // kheight100,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w500)),
                ),
                Text(
                  "499/-",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: themeGreen,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          kheight10,
          GestureDetector(
            onTap: () async {
              setState(() {
                isloading = true;
              });
              SharedPreferences prefs = await SharedPreferences.getInstance();
              var token = prefs.get('token');
              Map<String, dynamic> decodedToken =
                  JwtDecoder.decode(token.toString());
              decodedToken['_id'];

              var message = await CartRepository.addtoCart(
                  courseid: widget.data.data[widget.index].id,
                  userid: decodedToken['_id'],
                  context: context,
                  token: token.toString());
              setState(() {
                isloading = false;
              });
              showSnackBar(context, message);
              log("doneee");
            },
            child: Container(
              height: 60.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: themeGreen, borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: isloading
                      ? CupertinoActivityIndicator()
                      : Text(
                          "Add to Basket",
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
}
