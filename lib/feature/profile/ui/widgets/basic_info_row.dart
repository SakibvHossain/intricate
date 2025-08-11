import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class BasicInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLink;
  final Color? linkColor;
  const BasicInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isLink = false,
    this.linkColor,
  });

  @override
  Widget build(BuildContext context) {
    final valueWidget = isLink
        ? GestureDetector(
      onTap: () {
        // TODO: Implement navigation or action
      },
      child: CustomText(
        text: value,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: linkColor ?? AppColors.primaryColor,
        textDecoration: TextDecoration.underline,
      ),
    )
        : CustomText(
      text: value,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.fontColor,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: label,
          color: AppColors.fontColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        valueWidget,
      ],
    );
  }
}