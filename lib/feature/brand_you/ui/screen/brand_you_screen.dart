import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/brand_you/ui/widgets/custom_option_container.dart';
import 'package:intricate1/feature/survey/adaptability_surveyui/ui/screen/adaptability_survey_screen.dart';
import 'package:intricate1/feature/survey/communication_survey/ui/screen/communication_survey_screen.dart';
import 'package:intricate1/feature/survey/leadership_survey/ui/screen/leadership_survey_screen.dart';

class BrandYouScreen extends StatelessWidget {
  const BrandYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64.h,
                ),
                Center(
                  child: Text(
                    'Brand-You 15',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffFCFCFC)),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'AI-powered youth life-coaching career assessment focused on personal branding across three core competencies: communication, leadership, adaptability.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xffD2D2D2),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomOptionContainer(
                  imagepath: 'assets/images/communication_image.svg',
                  title: 'Communication',
                  subtitle:
                      'Conveying brand stories clearly and tailoring tone for different audiences.',
                  ontap: () => Get.to(() =>  CommunicationSurveyScreen()),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomOptionContainer(
                  imagepath: 'assets/images/leadership_image.svg',
                  title: 'Leadership',
                  subtitle:
                      'Guiding teams, pitching ideas, and influencing stakeholders in branding contexts.',
                  ontap: () => Get.to(() =>  LeadershipSurveyScreen()),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomOptionContainer(
                  imagepath: 'assets/images/adaptability.svg',
                  title: 'Adaptability',
                  subtitle:
                      'Thriving amid rapid shifts in markets, technology, and consumer trends.',
                  ontap: () => Get.to( AdaptabilitySurveyScreen()),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
