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
      final todayIndex = controller.days.indexWhere((day) {
        final now = DateTime.now();
        return day.date.day == now.day &&
            day.date.month == now.month &&
            day.date.year == now.year;
      });

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
        height: 73.h,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Animated cards with reverse overlap
            Positioned.fill(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: controller.days.length,
                padding: EdgeInsets.only(top: 10.h),
                itemBuilder: (context, index) {
                  final day = controller.days[index];
                  final today = DateTime.now();
                  final yesterday = today.subtract(const Duration(days: 1));

                  final bool isToday =
                      day.date.day == today.day &&
                      day.date.month == today.month &&
                      day.date.year == today.year;
                  final bool isYesterday =
                      day.date.day == yesterday.day &&
                      day.date.month == yesterday.month &&
                      day.date.year == yesterday.year;
                  final bool isFuture = day.date.isAfter(today);

                  final double height = isToday ? 90.h : 70.h;
                  final double width = isToday ? 113.w : 60.w;
                  Color bgColor;
                  Color textColor;

                  if (isYesterday) {
                    bgColor = Colors.green;
                    textColor = Colors.white;
                  } else if (isToday) {
                    bgColor = const Color(0xFF5F6CAF);
                    textColor = Colors.white;
                  } else if (isFuture) {
                    bgColor = Colors.white;
                    textColor = Colors.black87;
                  } else {
                    bgColor = Colors.grey;
                    textColor = Colors.white;
                  }

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(index * -15.w, 0, 0),
                    child: Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          gradient: isToday
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF5F6CAF),
                                    Color(0xFF7A8CD6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                          color: !isToday ? bgColor : null,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 6.w,
                        ),
                        child: Center(
                          child: isToday
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Day ${day.dayNumber}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: textColor,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
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
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          DateFormat.d().format(day.date),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: textColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ',',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          DateFormat.y().format(day.date),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: textColor,
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
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.d().format(day.date),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: textColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
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
