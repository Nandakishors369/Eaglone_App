import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  const ProductScreen({super.key});

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
                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
            ]),
          ),
          kheigh20,
          Row(
            children: [
              kwidth15,
              Text(
                "React Frontend Course",
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
              "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
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
