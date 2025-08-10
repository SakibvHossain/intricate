import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/home/data/controller/timer_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimerController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                        SizedBox(width: 4),
                        Text(
                          'Back',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Obx(() {
              double percent =
                  1 - (controller.remainingTime.value / controller.totalTime);
              return CircularPercentIndicator(
                radius: 130.r,
                lineWidth: 12.w,
                percent: percent,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade200,
                progressColor: const Color(0xFF5F6CAF),
                center: Text(
                  controller.formatTime(controller.remainingTime.value),
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _controlButton(
                    Icons.delete_outline,
                    onTap: controller.clearTimer,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: controller.isRunning.value
                          ? controller.pauseTimer
                          : controller.startTimer,
                      child: Container(
                        height: 70.w,
                        width: 70.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5F6CAF),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          controller.isRunning.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  _controlButton(Icons.refresh, onTap: controller.resetTimer),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _controlButton(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF5F6CAF)),
        ),
        child: Icon(icon, color: const Color(0xFF5F6CAF), size: 24),
      ),
    );
  }
}
