import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/widgets/text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final Widget? widget;
  final Color? textColor;
  final double? borderRadius;
  final double? textFontSize;
  final Widget? child;
  final FontWeight? textFontWeight;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.onTap,
    this.widget,
    required this.text,
    this.borderRadius,
    this.textFontSize,
    this.textColor,
    this.textFontWeight, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 52.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
        ),
        child: child ??
            CustomText(
              text: text ?? '', //* No need to check for null, fallback to empty string
              fontSize: textFontSize ?? 16.sp,
              fontWeight: textFontWeight ?? FontWeight.w500,
              color: textColor ?? AppColors.whiteColor,
            ),
      ),
    );
  }
}
