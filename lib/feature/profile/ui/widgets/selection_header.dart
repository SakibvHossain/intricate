import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const SectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: const Color(0xffFCFCFC),
          ),
          trailing ?? SizedBox(width: 18.w, height: 18.h),
        ],
      ),
    );
  }
}