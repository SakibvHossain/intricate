import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/feature/home/data/controller/home_controller.dart';
import 'package:intricate1/feature/home/data/controller/video_controller.dart';
import 'package:intricate1/feature/home/ui/screens/day_selector_widget.dart';
import 'package:intricate1/feature/home/ui/screens/timer_page.dart';
import 'package:intricate1/feature/notes/ui/screens/note_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final videoController = Get.put(VideoController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Saifur!',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Let's take it one step at a time.",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 10.h),
                DaySelectorWidget(),
                SizedBox(height: 10.h),
                Text(
                  'Time-based Routine Example:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(controller.tasks.length, (index) {
                      final task = controller.tasks[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: BorderSide(
                            color: const Color(0xFF000000).withAlpha(50),
                            width: 1.0,
                          ),
                        ),
                        elevation: 1,
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/time.png'),
                                      SizedBox(width: 6.w),
                                      Text(
                                        task.time,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => NotePage());
                                    },
                                    child: const Text(
                                      'Notes',
                                      style: TextStyle(
                                        color: Color(0xFF5F6CAF),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(color: Color(0xFFAFAFAF)),
                              SizedBox(height: 8.h),
                              Text(
                                task.type,
                                style: const TextStyle(color: Color(0xFF2D2D2D)),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              if (!task.isVideo)
                                Text(
                                  task.description,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              SizedBox(height: 10.h),
                              if (task.isVideo)
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: YoutubePlayer(
                                        controller:
                                            videoController.youtubeController,
                                        showVideoProgressIndicator: true,
                                        onReady: () {
                                          log('YouTube Player is ready');
                                        },
                                        onEnded: (data) {
                                          videoController.youtubeController
                                              .seekTo(
                                                const Duration(seconds: 0),
                                              );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.h,
                                      left: 0.w,
                                      right: 0.w,
                                      bottom: 0.h,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/onboarding/images/youtube.png',
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              else if (task.type != 'Hydrate')
                                CustomButton(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  onPressed: task.buttonText == 'Start Now'
                                      ? () {
                                          Get.to(() => TimerPage());
                                        }
                                      : () {},

                                  text: task.buttonText,
                                  backgroundColor: Color(0xFF5F6CAF),
                                  borderRadius: 4.r,
                                  prefixIconPath:
                                      task.type == 'Walk Time' ||
                                          task.type == 'Breathe Deeply'
                                      ? 'assets/profile/image/timer.png'
                                      : 'assets/profile/image/write.png',
                                  prefixIconHeight: 20.h,
                                  prefixIconWidth: 20.w,
                                  spaceBetweenPrefix: false,
                                ),
                              SizedBox(height: 6.h),
                              const Divider(color: Color(0xFFAFAFAF)),
                              SizedBox(height: 6.h),
                              Text(
                                'Once the task is complete, kindly submit your notes.',
                                style: TextStyle(
                                  color: const Color(0xFFF47C7C),
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
