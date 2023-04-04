import 'dart:developer';

import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pay/pay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../const.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var razorpay = Razorpay();
  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    log("payment is success");
    log("pymtn id  ${response.paymentId}");
    log("order id  ${response.orderId}");
    log("sign id  ${response.signature}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log(" ${response.message}");
    log("err ${response.error}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

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
                    "Payment",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  ),
                  Icon(
                    Icons.delete_outline,
                    color: kwhite,
                  ),
                ],
              ),
            ),
            kheigh20,
            kheigh20,
            SizedBox(
              height: 320.h,
              width: 400.w,
              child: Card(
                  child: Column(
                children: [
                  kheight10,
                  Row(
                    children: [
                      kwidth15,
                      appHeadings(content: "Choose Payment Method"),
                    ],
                  ),
                  GooglePayButton(
                      paymentConfigurationAsset: 'google_pay.json',
                      onPaymentResult: onGooglePayResult,
                      paymentItems: _paymentItems),
                  kheigh20,
                  ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> options = {
                          'key': 'rzp_test_DJG5OnjIJEoKOj',
                          'amount': 2000, // amount in paise
                          'name': 'Flutter Test',
                          'description': 'Test Payment',
                          'prefill': {
                            'contact': '9999999999',
                            'email': 'test@razorpay.com'
                          },
                        };
                        try {
                          razorpay.open(options);
                        } catch (e) {
                          log('Error: $e');
                        }
                      },
                      child: Text("Pay"))
                ],
              )),
            ),
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
                      textStyle: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "499/-",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: themeGreen,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            kheigh20,
            kheigh20,
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 375.w,
                decoration: BoxDecoration(
                    color: themeGreen, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Confirm and Pay",
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
            )
          ],
        ),
      ),
    );
  }
}

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

void onGooglePayResult(paymentResult) {
  log(paymentResult);
  log("worked ?");
}
