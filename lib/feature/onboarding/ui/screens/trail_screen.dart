import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:intricate1/widgets/button/custom_button.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class TrailScreen extends StatelessWidget {
  const TrailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Image
            Image.asset('assets/onboarding/images/trail_image.png', height: 220.h, width: 234.w,),

            //* SizedBox
            SizedBox(height: 16.h,),

            //* Title
            CustomText(text: 'Your Journey to a Better\nMind Starts Here', color: AppColors.fontColor, fontSize: 25.sp, fontWeight: FontWeight.w600,),

            //* SizedBox
            SizedBox(height: 16.h,),

            //* Description
            CustomText(text: 'We’re here to help you build daily routines that restore balance, joy, and strength — one step at a time.',color: AppColors.fontColor,fontSize: 16.sp, fontWeight: FontWeight.w400,),

            //* SizedBox
            SizedBox(height: 32.h,),

            //* Button
            CustomButton(text: 'Get Started – Free 3-Day Trial', onTap: (){
              Get.offAllNamed(AppRoute.home);
            },),
          ],
        ),
      ),
    );
  }
}
