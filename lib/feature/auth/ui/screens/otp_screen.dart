import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_text.dart';
import 'package:intricate1/core/components/custom_text_field.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/core/validation/email_validation.dart';
import 'package:intricate1/core/validation/name_validator.dart';
import 'package:intricate1/core/validation/pin_validation.dart';
import 'package:intricate1/feature/auth/data/controller/otp_controller.dart';
import 'package:intricate1/feature/auth/data/controller/sign_in_controller.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:intricate1/widgets/button/custom_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final signInKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Verify Code',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.fontColor,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: signInKey,
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                      controller: otpController.emailController,
                      validator: validateEmail,
                      labelText: 'E-main',
                      hintText: 'Enter your mail address'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: otpController.otpCodeController,
                    textInputType: TextInputType.number,
                    validator: validatePin,
                    labelText: 'OTP Code',
                    hintText: 'Enter code here',
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() {
                    return otpController.isLoading.value
                        ? const Center(
                      child:
                      CircularProgressIndicator(),) // Show loading spinner
                        : CustomButton(
                      text: 'Send',
                      color: AppColors.primaryColor,
                      textColor: AppColors.whiteColor,
                      borderRadius: 8.r,
                      onTap: () async {
                        if (signInKey.currentState!.validate()) {
                         await otpController.verifyOTP();
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}