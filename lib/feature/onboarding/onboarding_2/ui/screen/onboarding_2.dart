import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/onboarding_2_bg.png',
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'DO WHAT YOU LOVE NOW.',
                style: TextStyle(color: Color(0xffFCFCFC)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'TIME IS NON -REFUNDABLE,\nWEMUST USE IT WITH\nPURPOSE.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff00D700),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
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
                    color: Color(0xff00D700),
                    size: 12,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
