import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/feature/plan/Controller/plan_controller.dart';
import 'package:intricate1/feature/plan/Model/plan_model.dart';
import 'package:intricate1/feature/subscription/view/billing_information_view.dart';
import 'package:intricate1/feature/subscription/view/subscription_view.dart';

class PlanView extends StatelessWidget {
  PlanView({super.key});

  final PlanController _controller = Get.put(PlanController());
  List<Map<String, dynamic>> plans = [
    {
      'price': '\$19',
      'name': 'Basic Plan',
      'features': ['Routine only'],
    },
    {
      'price': '\$99',
      'name': 'Plus Plan',
      'features': ['Routine', 'Journal', 'Insights'],
    },
    {
      'price': '\$599',
      'name': 'Pro Plan',
      'features': ['All features', 'Priority Support'],
    },
    {
      'price': '\$199.99',
      'name': 'Pro Plan',
      'features': ['All features', 'Priority Support'],
    },
    {
      'price': '\$1999.99',
      'name': 'Pro Plan',
      'features': ['All features', 'Priority Support'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Continue your journey — \nyou’re just getting started.',
                    style: TextStyle(
                        color: const Color(0xffFCFCFC),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Unlock more personalized routines, progress tracking, and expert-curated videos.',
                    style: TextStyle(
                        color: const Color(0xffD2D2D2), fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plans[index]['price'],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: const Color(0xffFCFCFC),
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        plans[index]['name'],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: const Color(0xffD2D2D2),
                                            fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/coin_image.png',
                                    height: 72.h,
                                    width: 72.h,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Feature:',
                                style: TextStyle(
                                    color: const Color(0xffFCFCFC), fontSize: 16.sp),
                              ),
                              SizedBox(height: 8.h),
                              // Show features here dynamically
                              Column(
                                children: List.generate(
                                  plans[index]['features'].length,
                                  (featureIndex) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/feature_icon.svg'),
                                          SizedBox(width: 8.w),
                                          Text(
                                            plans[index]['features']
                                                [featureIndex],
                                            style: GoogleFonts.inter(
                                                color: const Color(0xffFCFCFC),
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              ComponentCustomButton(
                                text: 'Upgrade Now',
                                gradientColors: const [
                                  Color(0xff7EB243),
                                  Color(0xff024015)
                                ],
                                onTap: ()=>Get.to(()=>BillingInformationView()),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12.h,
                          ),
                      itemCount: plans.length)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
