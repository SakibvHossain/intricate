import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/feature/profile/data/model/plan_info.dart';
import 'package:intricate1/feature/profile/ui/widgets/plan_task_row.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class PlanInfoCard extends StatelessWidget {
  final List<PlanInfo> plans;
  const PlanInfoCard({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: const Color(0xff919191).withOpacity(0.20),
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < plans.length; i++) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: plans[i].title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.fontColor,
              ),
            ),
            SizedBox(height: 8.h),
            PlanTaskRow(
              fieldName: 'Tasks Completed:',
              completedValue: plans[i].completedTasks,
              totalValue: plans[i].totalTasks,
            ),
            if (i != plans.length - 1)
              Divider(
                color: const Color(0xff919191).withOpacity(0.20),
              ),
            SizedBox(height: 8.h),
          ]
        ],
      ),
    );
  }
}
