// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/subscription/controller/billing_controller.dart';
import 'package:intricate1/feature/subscription/controller/subscription_controller.dart';
import 'package:intricate1/feature/subscription/model/subscription_model.dart';
import 'package:intricate1/feature/subscription/view/billing_information_view.dart';

class SubscriptionView extends StatelessWidget {
  SubscriptionView({super.key});

  final SubscriptionController _controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, scrolledUnderElevation: 0,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Continue your journey — you\'re just getting started.',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Unlock more personalized routines, progress tracking, and expert-curated videos.',
                style: TextStyle(fontSize: 16.sp, color: Color(0xFF2D2D2D)),
              ),
              SizedBox(height: 15.h),
              Obx(
                () => Column(
                  children: _controller.plans
                      .map((plan) => _buildPlanCard(plan))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(SubscriptionPlan plan) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: plan.isPopular
              ? Color(0xFF5F6CAF)
              : Colors.grey.withOpacity(0.3),
          width: plan.isPopular ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (plan.isPopular)
          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          //     decoration: BoxDecoration(
          //       color: Color(0xFF5F6CAF).withOpacity(0.1),
          //       borderRadius: BorderRadius.circular(4.r),
          //     ),
          //     child: Text(
          //       'Most Popular',
          //       style: TextStyle(
          //         fontSize: 10.sp,
          //         color: Color(0xFF5F6CAF),
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // if (plan.isPopular) SizedBox(height: 12.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    plan.price,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 72.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFF3F4F8),
                    ),
                    child: Image.asset(
                      'assets/profile/image/coin.png',
                      height: 48.91.h,
                      width: 48.91.w,
                    ),
                  ),
                ],
              ),
              Text(
                plan.title,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Features: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: plan.features
                .map(
                  (feature) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '➤ ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFF5F6CAF),
                              ),
                            ),
                            Text(
                              feature,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _controller.setSelectedPlan(plan.title);
                Get.find<BillingController>().setSelectedPlan(plan.title);
                Get.to(() => BillingInformationView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5F6CAF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                'Upgrade Now',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
