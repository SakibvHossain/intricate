import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign, this.textDecoration});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 32, //* Explicit font size
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? const Color(0xffFCFCFC),
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: Color(0xff00D700)
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
