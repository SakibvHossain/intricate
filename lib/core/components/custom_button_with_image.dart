import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomButtonWithImage extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final Widget? widget;
  final Color? textColor;
  final double? borderRadius;
  final double? textFontSize;
  final String imageUrl;
  final FontWeight? fontWeight;

  const CustomButtonWithImage({
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
    required this.imageUrl,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl, width: 21.w, height: 21.h,),
            SizedBox(width: 4.w,),
            CustomText(
              text: text,
              fontSize: textFontSize??18.sp,
              fontWeight: fontWeight,
              color: textColor ?? Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
