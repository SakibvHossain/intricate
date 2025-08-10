import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_nav_screen.dart';
import 'package:intricate1/feature/onboarding/bindings/survey_controller.dart';
import 'package:intricate1/feature/onboarding/data/controller/assessment_controller.dart';
import 'package:intricate1/feature/onboarding/ui/screens/assessment_page.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:intricate1/widgets/button/custom_button.dart';

class ReadyPlan extends StatelessWidget {
  ReadyPlan({super.key});

  final assessmentController = Get.put(AssessmentController());
  final surveyController = Get.put(SurveyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    'Here\'s your personalized 7-day reset plan.',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    textAlign: TextAlign.center,
                    'Each day includes guided tasks to help you feel better, one moment at a time.',
                    style: TextStyle(color: const Color(0xFF2D2D2D), fontSize: 16.sp),
                  ),
                  SizedBox(height: 36.h,),
                  CustomButton(
                    borderRadius: 8.r,
                    onTap: () {
                      // Get.toNamed(AppRoute.navBar);
                      Get.to(BottomNavScreen());
                    },
                    text: 'View Today\'s Schedule',
                  ),
                  SizedBox(height: 24.h,),
                  GestureDetector(
                    // onTap: _regeneratePlan,
                    onTap: () {
                      Get.offAll(() => AssessmentPage());
                    },
                    child: const Text(
                      'Regenerate your plan',
                      style: TextStyle(
                        color: Color(0xFF2D2D2D),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
