import 'dart:developer';

import 'package:eaglone/Repositories/checkout.dart';
import 'package:eaglone/model/Cart%20Model/cart_model.dart';
import 'package:eaglone/Repositories/cart.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int pricetotal = 0;
  bool paid = false;
  bool isLoading = false;
  var razorpay = Razorpay();
  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds

    log("payment is success");
    log("pymtn id  ${response.paymentId}");
    log("order id  ${response.orderId}");
    log("sign id  ${response.signature}");
    log("place order");
    Checkout.placeOrder(transactionId: response.paymentId, context: context);
    log("placed order");
    setState(() {
      paid == true;
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
              "Payment is Success You can view you course in the my course section"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok")),
          ],
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(response.error.toString()),
          content: Text(response.message.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok")),
          ],
        );
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  Widget build(BuildContext context) {
    bool fetched = false;
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
                  "Order Details",
                  style: GoogleFonts.montserrat(
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
                future: CartRepository.getCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingCart();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data!;

                    return ListView.separated(
                      itemCount: data.data.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(
                          endIndent: 15.w,
                          indent: 15.w,
                          thickness: 0.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return cartItems(data: data, index: index);
                      },
                    );
                  } else if (snapshot.data!.data.isEmpty) {
                    return Center(
                      child: appHeadings(content: "Please Add Some Courses"),
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset("assets/errorLottie.json"),
                      ),
                    );
                  }
                }),
          ),
          /*  SizedBox(
            height: 320.h,
          ), */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
                future: CartRepository.getCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return hell; /* Text(
                      "Fetching your cart",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: themeGreen,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500)),
                    ); */
                  } else if (snapshot.hasData && snapshot.data != null) {
                    fetched = true;

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
                    pricetotal = total;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight5,
                        Text(
                          "Order Info",
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$price/-",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
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
                                  fontSize: 14.sp,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$discount/-",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
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
                                  fontSize: 14.sp,
                                  color: kdgrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ("$total/-"),
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        kheigh20,
                        Center(
                          child: GestureDetector(
                              onTap: () {
                                paymentFunction(amount: pricetotal);
                              },
                              child: Container(
                                height: 50.h,
                                width: 375.w,
                                decoration: BoxDecoration(
                                    color: themeGreen,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Checkout",
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
                              )),
                        ),
                        kheigh20
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No Course Found",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: themeGreen,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    );
                  }
                }),
          ),
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
            height: 150,
            child: Row(
              children: [
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.data[index].image)),
                      borderRadius: BorderRadius.circular(10)),
                ),
                kwidth15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight10,

                    SizedBox(
                      height: 60.h,
                      width: 200.w,
                      child: Text(
                        data.data[index].title,
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      data.data[index].category,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                      ),
                    ),
                    //kheigh20,
                    kheight5,
                    Row(
                      children: [
                        Text(
                          "${data.data[index].price}/-",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        kwidth100,
                        /*  kwidth20,
                        kwidth20,
                        kwidth10, */
                        IconButton(
                            onPressed: () async {
                              /*   SharedPreferences prefs =
                                  await SharedPreferences.getInstance(); */
                              CartRepository.deleteCart(
                                  courseid: data.data[index].id,
                                  context: context);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  paymentFunction({required int amount}) async {
    Map<String, dynamic> options = {
      'key': 'rzp_test_DJG5OnjIJEoKOj',
      'amount': amount * 100, // amount in paise
      'name': 'Eaglone Learning',
      'description': 'name',
      'prefill': {'contact': '9999999999', 'email': 'test@razorpay.com'},
    };
    razorpay.open(options);
    // await Checkout.placeOrder(courses: courses, transactionId: razorpay.t, context: context)
    /* if (paid == false) {
      return showDialog(
        context: context,
        builder: (context) {
          return const CupertinoActivityIndicator();
        },
      );
    } */
  }
}

class LoadingCart extends StatelessWidget {
  const LoadingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400.w,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kblack,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
