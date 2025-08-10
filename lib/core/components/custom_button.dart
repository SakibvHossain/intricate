import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class ComponentCustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final List<Color>? gradientColors; // 新增渐变色参数
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
    this.gradientColors, // 新增渐变色参数
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
          // 使用渐变色或纯色
          gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
          color: gradientColors == null ? color : null, // 当没有渐变时使用纯色
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 12.r),
        ),
        child: text == ''
            ? const CircularProgressIndicator()
            : CustomText(
                text: text,
                fontSize: textFontSize ?? 18.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
      ),
    );
  }
}
