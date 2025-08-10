import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/core/components/custom_text_field.dart';
import 'package:intricate1/core/utils/image_path.dart';
import 'package:intricate1/feature/auth/data/controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

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
                child: Form(
                  key: signUpKey,
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
                          fontWeight: FontWeight.w500,
                        ),
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
                        controller: controller.fullNameController,
                        labelText: 'Enter your name',
                        hintText: 'Full Name',
                        validator: (value) =>
                        value == null || value.isEmpty ? 'Enter your name' : null,
                      ),
                      SizedBox(height: 16.h),

                      // Email Field
                      CustomTextField(
                        controller: controller.emailController,
                        labelText: 'Email ID',
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) =>
                        value == null || value.isEmpty ? 'Enter your email' : null,
                      ),
                      SizedBox(height: 16.h),

                      // Mobile Number Field
                      CustomTextField(
                        controller: controller.mobileController,
                        labelText: 'Mobile number',
                        hintText: 'Mobile Number',
                        textInputType: TextInputType.phone,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter your mobile number'
                            : null,
                      ),
                      SizedBox(height: 16.h),

                      // Password Field
                      CustomTextField(
                        controller: controller.passwordController,
                        labelText: 'Password',
                        hintText: 'Password',
                        isObscure: true,
                        validator: (value) =>
                        value == null || value.isEmpty ? 'Enter your password' : null,
                      ),
                      SizedBox(height: 16.h),

                      // Confirm Password Field
                      CustomTextField(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        isObscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm your password';
                          }
                          if (value != controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),

                      // Sign Up Button
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : ComponentCustomButton(
                          text: 'Sign up',
                          gradientColors: const [
                            Color(0xFF7EB243),
                            Color(0xFF024015),
                          ],
                          borderRadius: 8,
                          height: 50,
                          onTap: () {
                            if (signUpKey.currentState!.validate()) {
                              controller.signUp();
                            } else {
                              Get.snackbar('Error', 'Please fill all the fields');
                            }
                          },
                        );
                      }),

                      const SizedBox(height: 16),
                      Text(
                        'If you already have an account please',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(height: 12),

                      GestureDetector(
                        onTap: () {
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
      ),
    );
  }
}
