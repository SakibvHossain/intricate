import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/home/data/controller/timer_controller.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_navbar_base_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimerController());

    return BaseScreen(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          ),
          title: const Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: CustomBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                double percent =
                    1 - (controller.remainingTime.value / controller.totalTime);
                return CircularPercentIndicator(
                  radius: 130.r,
                  lineWidth: 14.w,
                  percent: percent,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.grey.shade700,
                  progressColor: Colors.green,
                  center: Text(
                    controller.formatTime(controller.remainingTime.value),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _controlButton(
                      Icons.delete_outline,
                      const Color(0xFFEB5757),
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
                            color: Colors.green,
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
                    _controlButton(
                      Icons.refresh,
                      Colors.white,
                      onTap: controller.resetTimer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _controlButton(
      IconData icon,
      Color color, {
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF5F6CAF)),
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }
}
