import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_text_field.dart';
import 'package:intricate1/core/utils/image_path.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final mobileController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
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
                    // Logo
                    Image.asset(Images.authTypeLogo, height: 200.h, width: 327),
                    const SizedBox(height: 50),

                    const Text(
                      'Continue your account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
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
                    const SizedBox(height: 16),

                    // Name Field
                    CustomTextField(
                      labelText: 'Enter your name',
                      hintText: 'Full Name',
                      controller: nameController,
                    ),
                    SizedBox(height: 16.h),

                    // Email Field
                    CustomTextField(
                      labelText: 'Email ID',
                      hintText: 'Email',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),

                    // Mobile Number Field
                    CustomTextField(
                      labelText: 'Mobile number',
                      hintText: 'Mobile Number',
                      controller: mobileController,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.h),

                    // Password Field
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'Password',
                      isObscure: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 16.h),

                    // Confirm Password Field
                    CustomTextField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      isObscure: true,
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: 24.h),

                    // Sign Up Button
                    ComponentCustomButton(
                      text: 'Sign in',
                      gradientColors: [
                        const Color(0xFF7eb243),
                        const Color(0xFF024015)
                      ],
                      borderRadius: 8,
                      height: 50,
                      onTap: () {
                        // 按钮点击事件
                      },
                    ),

                    const SizedBox(height: 16),
                    Text(
                      'If you already have an account please',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap: () {
                        // Navigate to sign in screen
                        // Get.to(SignInScreen());
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
