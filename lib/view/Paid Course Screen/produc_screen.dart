import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eaglone/model/Product%20Model/paidcourse_model.dart';
import 'package:eaglone/view/Cart/Cart_Screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/const.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.data, required this.index});
  PaidCourseModel data;
  int index;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
              Image.network(
                widget.data.data[widget.index].image,
                fit: BoxFit.cover,
              ),
              Image.network(
                widget.data.data[widget.index].image,
                fit: BoxFit.cover,
              ),
              Image.network(
                widget.data.data[widget.index].image,
                fit: BoxFit.cover,
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
          kheigh20,
          kheigh20,
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: themeGreen, borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
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
