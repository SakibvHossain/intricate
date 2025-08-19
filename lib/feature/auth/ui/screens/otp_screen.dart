import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_text.dart';
import 'package:intricate1/core/components/custom_text_field.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/core/validation/email_validation.dart';
import 'package:intricate1/core/validation/pin_validation.dart';
import 'package:intricate1/feature/auth/data/controller/otp_controller.dart';
import 'package:intricate1/widgets/button/custom_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final otpController = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    final signInKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    const CustomText(
                      text: 'Verify Code',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: const TextSpan(
                        text: 'to continue to ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Growefx',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    Form(
                      key: signInKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomTextField(
                              controller:otpController.emailController,
                              validator: validateEmail,
                              labelText: 'E-mail',
                              hintText: 'Enter your mail address',
                            ),
                          ),
                          SizedBox(height: 16.h),
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
                          SizedBox(height: 30.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Obx(() {
                              return otpController.isLoading.value
                                  ? const Center(child: CircularProgressIndicator())
                                  : ComponentCustomButton(
                                      text: 'Send',
                                      gradientColors: const [
                                        Color(0xFF7eb243),
                                        Color(0xFF024015)
                                      ],
                                      borderRadius: 8,
                                      height: 50,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
