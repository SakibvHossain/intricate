import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  const ProfileAvatar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 120.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEEf0f8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 108.w,
            height: 108.h,
          ),
        ),
      ),
    );
  }
}