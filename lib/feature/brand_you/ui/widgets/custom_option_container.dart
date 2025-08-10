import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOptionContainer extends StatelessWidget {
  final String imagepath;
  final String title;
  final String subtitle;
  final VoidCallback? ontap;
  const CustomOptionContainer({super.key, required this.imagepath, required this.title, required this.subtitle, this.ontap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap:ontap ,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  imagepath,
                  height: 48.h,
                  width: 48.w,
                ),
                const Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Color(0xffFCFCFC)),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                  fontSize: 12.sp, color: Color(0xffFCFCFC)),
            )
          ],
        ),
      ),
    );
  }
}
