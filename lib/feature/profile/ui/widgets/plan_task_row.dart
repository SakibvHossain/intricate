import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class PlanTaskRow extends StatelessWidget {
  final String fieldName;
  final int completedValue;
  final int totalValue;
  const PlanTaskRow({
    super.key,
    required this.fieldName,
    required this.completedValue,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: fieldName,
          color: Color(0xffADADAD),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        GestureDetector(
          onTap: () {
            // TODO: Implement navigation or action
          },
          child: CustomText(
            text: '$completedValue/$totalValue',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xffADADAD),
          ),
        ),
      ],
    );
  }
}