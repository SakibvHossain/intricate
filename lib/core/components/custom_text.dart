import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.overflow,
      this.textAlign});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
      ),
    );
  }
}
