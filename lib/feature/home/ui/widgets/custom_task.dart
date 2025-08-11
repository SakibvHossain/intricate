import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/components/custom_button_dev_2.dart';
import 'package:intricate1/feature/home/ui/widgets/custom_button.dart';

class TodaysTaskWidget extends StatelessWidget {
  final String title;
  final String time;
  final Widget child;
  const TodaysTaskWidget({super.key, required this.title, required this.time , required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 120),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Expanded(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis, // Prevents overflow
        maxLines: 2, // Keeps it in one line
      ),
    ),
    const SizedBox(width: 8), // Small space between texts
    Text(
      time,
      style: const TextStyle(
        color: Color(0xff00D700),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
            ],
           ),
           SizedBox(height: 16.h,),
           child
        ],
      ),
    );
  }
}