import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;

  final bool? isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isAutofocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final VoidCallback? onTap;
  final bool? isPassword;
  final TextInputType? textInputType;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,

    this.controller,
    this.isObscure,
    this.validator,
    this.isAutofocus = false,
    this.focusNode,
    this.nextFocus,
    this.onTap,
    this.isPassword, this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.w, left: 9.w),
          child: CustomText(
            text: labelText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color:  Colors.white,
            // color: AppColor.textColorSecond,
          ),
        ),
        SizedBox(height: 5.h),
        Center(
          child: SizedBox(
            height: 60.h,
            // width: double.infinity * 0.7,
            child: TextFormField(
              validator: validator,
              keyboardType: textInputType ?? TextInputType.text,
              controller: controller,
              obscureText: isObscure ?? false,
              onFieldSubmitted: (text) => nextFocus != null
                  ? FocusScope.of(context).requestFocus(nextFocus)
                  : null,
              style: GoogleFonts.poppins(
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
                // color: AppColor.textColor,
              ),
              decoration: InputDecoration(
                fillColor:  Colors.grey[900],
                filled: true,
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  // color: AppColor.textColor,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 6.h),
                border:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12.r))
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
