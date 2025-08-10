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
import 'package:intricate1/core/validation/password_validation.dart';
import 'package:intricate1/feature/auth/data/controller/sign_up_controller.dart';
import 'package:intricate1/feature/auth/ui/screens/otp_screen.dart';
import 'package:intricate1/routes/app_routes.dart';
import 'package:intricate1/widgets/button/custom_button.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final signUpKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Sign Up',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.fontColor,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: signUpKey,
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: controller.fullNameController,
                    validator: validateName,
                      labelText: 'Full Name', hintText: 'Enter your full name'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                      controller: controller.userNameController,
                      validator: validateName,
                      labelText: 'Username', hintText: 'Enter your username'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: controller.emailController,
                    validator: validateEmail,
                      labelText: 'E-main', hintText: 'Enter your mail address'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: controller.passwordController,
                    validator: validatePassword,
                    labelText: 'Password',
                    hintText: '********',
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx((){
                    return controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : CustomButton(
                      text: 'Sign Up',
                      color: AppColors.primaryColor,
                      textColor: AppColors.whiteColor,
                      borderRadius: 8.r,
                      onTap: () {
                        if (signUpKey.currentState!.validate()) {
                          //Todo: Implement Signup after that use this Get.to(OtpScreen());
                          controller.signUp();
                        }else{
                          debugPrint('++++++++++++++++++++++++++Something wrong happens');
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 42),
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.fontColor,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoute.signIn);
                      },
                    text: 'Sign In',
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
