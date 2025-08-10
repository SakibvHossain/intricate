// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/feature/plan/Controller/plan_controller.dart';
import 'package:intricate1/feature/plan/Model/plan_model.dart';
import 'package:intricate1/feature/subscription/view/subscription_view.dart';

class PlanView extends StatelessWidget {
  PlanView({super.key});

  final PlanController _controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20.h),
                _buildWelcomeBack(),
                SizedBox(height: 10.h),
                _buildMotivationText(),
                SizedBox(height: 25.h),
                _buildPlanSummaryHeader(),
                SizedBox(height: 20.h),
                _buildPlanList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            log('Create Plan Clicked');
          },
          child: Text(
            '+ Create Plan',
            style: TextStyle(
              color: Color(0xFF5F6CAF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeBack() {
    return Text(
      'Welcome back, ${_controller.userName.value}!',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMotivationText() {
    return const Text(
      'Let\'s take it one step at a time.',
      style: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildPlanSummaryHeader() {
    return const Text(
      'Plan Summary',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPlanList(BuildContext context) {
    return Obx(
      () => Column(
        children: _controller.plans
            .map((plan) => _buildPlanCard(plan, context))
            .toList(),
      ),
    );
  }

  Widget _buildPlanCard(Plan plan, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFAFAFAF).withAlpha(50),
          // width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                icon: Image.asset(
                  'assets/profile/image/filter.png',
                  height: 24.h,
                  width: 24.w,
                ),
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                ),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    enabled: false,
                    height: 30.h,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        const SizedBox(width: double.infinity),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                          onPressed: Get.back,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'restart',
                    child: Center(
                      child: Text(
                        'Restart Plan',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'cancel',
                    child: Center(
                      child: Text(
                        'Cancel Plan',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'upgrade',
                    child: Center(
                      child: Text(
                        'Upgrade Plan',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
                onSelected: (String value) {
                  switch (value) {
                    case 'restart':
                      _showConfirmationDialog(context, 'restart', plan.name);
                      debugPrint('Restart Plan tapped');
                      break;
                    case 'cancel':
                      _showConfirmationDialog(context, 'cancel', plan.name);
                      debugPrint('Cancel Plan tapped');
                      break;
                    case 'upgrade':
                      Get.to(() => SubscriptionView());
                      debugPrint('Upgrade Plan tapped');
                      break;
                  }
                },
              ),
            ],
          ),
          const Divider(color: Color(0xFFC0C0C0)),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Status: ',
                  style: TextStyle(
                    color: const Color(0xFF2D2D2D),
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: plan.status,
                  style: TextStyle(
                    color: const Color(0xFF626262),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(color: Color(0xFFC0C0C0)),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tasks Completed: ',
                  style: TextStyle(
                    color: const Color(0xFF2D2D2D),
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: '${plan.tasksCompleted}/${plan.totalTasks}',
                  style: TextStyle(
                    color: const Color(0xFF626262),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),
          Column(
            children: [
              // First row of 10 containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(10, (index) {
                  bool isCompleted = index < plan.tasksCompleted;
                  return _buildProgressContainer(isCompleted, true);
                }),
              ),
              const SizedBox(height: 5),
              // Second row of 10 containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(10, (index) {
                  bool isCompleted = index < (plan.tasksCompleted - 10);
                  return _buildProgressContainer(isCompleted, false);
                }),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(color: Color(0xFFC0C0C0)),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Next Action: ',
                  style: TextStyle(
                    color: const Color(0xFF2D2D2D),
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: plan.nextAction,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF626262),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressContainer(bool isCompleted, bool isFirstRow) {
    return Container(
      width: 25,
      height: 10,
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFF5F6CAF) : const Color(0xFFE3E3E3),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}

void _showConfirmationDialog(
  BuildContext context,
  String action,
  String planName,
) {
  bool isRestart = action == 'restart';
  // final width = MediaQuery.sizeOf(context).width;

  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: double.infinity, // Takes maximum available width
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                'assets/profile/image/thinking.png',
                height: 72.h,
                width: 72.w,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFFF47C7C),
                  ),
                  children: [
                    TextSpan(
                      text: isRestart
                          ? 'Are you sure restart your\n'
                          : 'Are you sure Cancel your\n',
                    ),
                    TextSpan(text: '$planName!'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: CustomButton(
                    fontSize: 12.sp,
                    borderRadius: 5.r,
                    textColor: const Color(0xFF2D2D2D),
                    backgroundColor: const Color(0xFFD5D5D5).withAlpha(50),
                    onPressed: () {
                      Get.back();
                    },
                    text: "No, Cancel",
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: CustomButton(
                    borderRadius: 5.r,
                    backgroundColor: const Color(0xFF5F6CAF),
                    fontSize: 12.sp,
                    onPressed: () {
                      Get.back();
                    },
                    text: isRestart ? "Yes, I'm Sure" : "Yes, I'm Sure",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
