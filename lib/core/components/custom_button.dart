import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class ComponentCustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final Widget? widget;
  final Color? textColor;
  final double? borderRadius;
  final double? textFontSize;
  final FontWeight? fontWeight;

  const ComponentCustomButton({
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
    this.fontWeight,
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
          color: color,
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 12.r),
        ),
        child: text == ''
            ? const CircularProgressIndicator()
            : CustomText(
          text: text,
          fontSize: textFontSize??18.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
