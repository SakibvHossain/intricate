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
import 'package:intricate1/feature/auth/data/controller/sign_in_controller.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:intricate1/widgets/button/custom_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final signInController = Get.put(SignInController());

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
          text: 'Sign In',
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
                      controller: signInController.emailController,
                      validator: validateEmail,
                      labelText: 'E-main',
                      hintText: 'Enter your mail address'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: signInController.passwordController,
                    validator: validateName,
                    labelText: 'Password',
                    hintText: '********',
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() {
                    return signInController.isLoading.value
                        ? const Center(
                            child:
                                CircularProgressIndicator(),) // Show loading spinner
                        : CustomButton(
                            text: 'Sign In',
                            color: AppColors.primaryColor,
                            textColor: AppColors.whiteColor,
                            borderRadius: 8.r,
                            onTap: () async {
                              if (signInKey.currentState!.validate()) {
                               await signInController.signIn();
                              }
                            },
                          );
                  }),
                ),

                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 42),
            child: RichText(
              text: TextSpan(
                text: 'Don’t have an account? ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.fontColor,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(AppRoute.signUp);
                      },
                    text: 'Sign up',
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
