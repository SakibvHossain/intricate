import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/onboarding/data/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return CustomBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 256.h,
              width: 287.w,
            ),
          )),
    );
  }
}

//
// Container(
// height: MediaQuery.sizeOf(context).height,
// width: MediaQuery.sizeOf(context).width,
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// begin: AlignmentDirectional.topStart,
// end: Alignment.bottomLeft,
// colors: [Color(0xff5F6CAF), Color(0xff212848)],
// ),
// ),
// child: Center(
//
// child: CustomText(
// text: 'INTRICATE',
// fontSize: 32.sp,
// fontWeight: FontWeight.w700,
// color: const Color(0xffFCFCFC),
// textAlign: TextAlign.center,
// ),
// ),
// ),
