import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: Alignment.bottomLeft,
            colors: [Color(0xff5F6CAF), Color(0xff212848)],
          ),
        ),
        child: Center(
          child: CustomText(
            text: 'INTRICATE',
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xffFCFCFC),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
