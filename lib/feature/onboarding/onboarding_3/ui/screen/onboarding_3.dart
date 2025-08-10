import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/onboarding_3_bg.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOU BECOME WHAT YOU\nWANT TO BE, BY CONSTANTLY\nBEING WHO YOU WANT TO\nBECOME, EACH DAY...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00D700)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 12,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 12,
                ),
                Icon(
                  Icons.circle,
                  color: Color(0xff00D700),
                  size: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
