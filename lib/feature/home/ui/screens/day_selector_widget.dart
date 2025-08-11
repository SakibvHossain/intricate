import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/feature/home/data/controller/day_selector_controller.dart';

class DaySelectorWidget extends StatelessWidget {
  final controller = Get.put(DaySelectorController());
  final ScrollController _scrollController = ScrollController();

  DaySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todayIndex = controller.days.indexWhere((day) => day.isToday);

      if (todayIndex != -1) {
        _scrollController.animateTo(
          todayIndex * 60.w,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });

    return Obx(
          () => SizedBox(
        height: 90.h,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black, // Background color set to black
              ),
            ),
            Positioned.fill(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: controller.days.length,
                itemBuilder: (context, index) {
                  final day = controller.days[index];

                  // Size logic: Only selected date is larger, others are minimized
                  final double height = day.isSelected ? 90.h : 60.h;
                  final double width = day.isSelected ? 113.w : 50.w;
                  Color? bgColor;
                  Color dayTextColor = Colors.white; // Day text color set to white
                  Color dateTextColor = Colors.blue; // Date text color set to blue

                  if (day.isSelected) {
                    bgColor = const Color(0xFF008000); // Green for selected
                  } else if (day.isToday) {
                    bgColor = const Color(0xFF5F6CAF); // Blue for today
                  } else if (day.isYesterday) {
                    bgColor = const Color(0xFF00C781); // Green for yesterday
                  } else if (day.isFuture) {
                    bgColor = Colors.black; // White for future
                  } else {
                    bgColor = Colors.grey; // Grey for past
                  }

                  return GestureDetector(
                    onTap: () {
                      controller.selectDay(index);
                      // Animate scroll to center the selected day
                      _scrollController.animateTo(
                        index * 100.w,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInBack,
                      );
                    },
                    child: Transform.translate(
                      offset:Offset(index * -18.w, 0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInBack,
                        //transform: Matrix4.translationValues(index * -18.w, 0, 0),
                        child: Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: day.isSelected
                                  ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day ${day.dayNumber}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: dayTextColor, // White for day
                                      fontWeight: FontWeight.w600,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black26,
                                          offset: Offset(1, 1),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat.E().format(day.date),
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: dayTextColor, // White for weekday
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        DateFormat.d().format(day.date),
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: dateTextColor, // Blue for date
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ',',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: dayTextColor, // White for comma
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        DateFormat.y().format(day.date),
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: dayTextColor, // White for year
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.E().format(day.date),
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: dayTextColor, // White for weekday
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.d().format(day.date),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: dateTextColor, // Blue for date
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}