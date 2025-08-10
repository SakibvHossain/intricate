import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/components/custom_background.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'THE LAW OF COMPENSATION',
                  style: TextStyle(fontSize: 14, color: Color(0XFFFCFCFC)),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'THE AMOUNT OF MONEY OR GOODS YOU\nRECEIVE WILL BE IN DIRECT RATIO To THE\nNEED FOR WHAT YOU DO, YOUR ABILITY\nTO DO IT, AND THE DIFFICULTY IN REPLACING YOU.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xff00D700),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Image.asset(
            'assets/images/light.png',
            width: double.infinity,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: Color(0xff00D700),
              ),
              Icon(Icons.circle, color: Colors.white),
              Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
