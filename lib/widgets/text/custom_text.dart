import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 32, //* Explicit font size
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? const Color(0xffFCFCFC),
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
